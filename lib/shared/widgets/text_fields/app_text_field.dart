import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// Enum representing the different states of a text field
enum TextFieldState {
  defaultState,
  press,
  typing,
  filled,
  error,
  disabled,
  delete,
  success,
  search,
}

/// A customizable text field widget that supports multiple states
/// including default, focused, filled, error, disabled, delete, success, and search.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.errorText,
    this.showCounter = false,
    this.maxLength,
    this.enabled = true,
    this.showDeleteIcon = false,
    this.showSearchIcon = false,
    this.showSuccessIcon = false,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.onTap,
    this.onDeleteTap,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.inputFormatters,
    this.width = 335,
    this.height = 48,
    this.suffixIcon,
    this.prefixIcon,
  });

  /// Label text displayed above the text field
  final String? label;

  /// Hint text displayed when the field is empty
  final String? hintText;

  /// Error text displayed below the field when in error state
  final String? errorText;

  /// Whether to show the character counter (e.g., "0/10")
  final bool showCounter;

  /// Maximum length of input text
  final int? maxLength;

  /// Whether the text field is enabled
  final bool enabled;

  /// Whether to show the delete icon on the right
  final bool showDeleteIcon;

  /// Whether to show the search icon on the left
  final bool showSearchIcon;

  /// Whether to show the success check icon on the right
  final bool showSuccessIcon;

  /// Controller for the text field
  final TextEditingController? controller;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Callback when the field is tapped
  final VoidCallback? onTap;

  /// Callback when the delete icon is tapped
  final VoidCallback? onDeleteTap;

  /// Callback when the user submits the text
  final ValueChanged<String>? onSubmitted;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Whether to obscure the text
  final bool obscureText;

  /// Whether to autofocus
  final bool autofocus;

  /// Whether the field is read only
  final bool readOnly;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Width of the text field
  final double width;

  /// Height of the text field
  final double height;

  /// Custom suffix icon widget
  final Widget? suffixIcon;

  /// Custom prefix icon widget
  final Widget? prefixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _hasText = _controller.text.isNotEmpty;

    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _focusNode.removeListener(_handleFocusChange);
    _controller.removeListener(_handleTextChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleTextChange() {
    final hasText = _controller.text.isNotEmpty;
    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  TextFieldState get _currentState {
    if (!widget.enabled) return TextFieldState.disabled;
    if (widget.errorText != null && widget.errorText!.isNotEmpty) {
      return TextFieldState.error;
    }
    if (widget.showSuccessIcon && _hasText) return TextFieldState.success;
    if (widget.showSearchIcon) return TextFieldState.search;
    if (widget.showDeleteIcon && _hasText) return TextFieldState.delete;
    if (_isFocused && _hasText) return TextFieldState.typing;
    if (_isFocused) return TextFieldState.press;
    if (_hasText) return TextFieldState.filled;
    return TextFieldState.defaultState;
  }

  Color get _borderColor {
    switch (_currentState) {
      case TextFieldState.press:
      case TextFieldState.typing:
      case TextFieldState.success:
        return AppColors.textFieldBorderFocused;
      case TextFieldState.error:
        return AppColors.textFieldBorderError;
      case TextFieldState.defaultState:
      case TextFieldState.filled:
      case TextFieldState.disabled:
      case TextFieldState.delete:
      case TextFieldState.search:
        return AppColors.textFieldBorderDefault;
    }
  }

  Color get _labelColor {
    switch (_currentState) {
      case TextFieldState.error:
        return AppColors.textFieldError;
      case TextFieldState.disabled:
        return AppColors.textFieldDisabledText;
      default:
        return AppColors.textFieldText;
    }
  }

  Color get _textColor {
    switch (_currentState) {
      case TextFieldState.disabled:
        return AppColors.textFieldDisabledText;
      default:
        return AppColors.textFieldText;
    }
  }

  Color get _hintColor => AppColors.textFieldPlaceholder;

  Color get _backgroundColor {
    if (_currentState == TextFieldState.disabled) {
      return AppColors.textFieldDisabledBg;
    }
    return AppColors.white;
  }

  Widget? get _suffixIconWidget {
    if (widget.suffixIcon != null) return widget.suffixIcon;

    if (widget.showSuccessIcon && _hasText) {
      return _buildIcon(
        Icons.check_circle,
        AppColors.textFieldSuccess,
      );
    }

    if (widget.showDeleteIcon && _hasText) {
      return _buildIconButton(
        Icons.cancel,
        AppColors.textFieldBorderDefault,
        () {
          _controller.clear();
          widget.onDeleteTap?.call();
          widget.onChanged?.call('');
        },
      );
    }

    return null;
  }

  Widget? get _prefixIconWidget {
    if (widget.prefixIcon != null) return widget.prefixIcon;

    if (widget.showSearchIcon) {
      return _buildIcon(
        Icons.search,
        _isFocused ? AppColors.textFieldText : AppColors.textFieldBorderDefault,
      );
    }

    return null;
  }

  Widget _buildIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Icon(
        icon,
        size: 20,
        color: color,
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: 20,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.textFieldLabel.copyWith(
              color: _labelColor,
            ),
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            autofocus: widget.autofocus,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onSubmitted: widget.onSubmitted,
            style: AppTextStyles.textFieldInput.copyWith(
              color: _textColor,
            ),
            cursorColor: AppColors.textFieldBorderFocused,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyles.textFieldHint.copyWith(
                color: _hintColor,
              ),
              filled: true,
              fillColor: _backgroundColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: (widget.height - 24) / 2,
              ),
              counterText: '',
              prefixIcon: _prefixIconWidget,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 20,
              ),
              suffixIcon: _suffixIconWidget,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: _borderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: _borderColor,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.textFieldBorderDefault,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.textFieldBorderError,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.textFieldBorderError,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        if (widget.showCounter || (widget.errorText != null && widget.errorText!.isNotEmpty)) ...[
          const SizedBox(height: 4),
          SizedBox(
            width: widget.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.errorText != null && widget.errorText!.isNotEmpty)
                  Expanded(
                    child: Text(
                      widget.errorText!,
                      style: AppTextStyles.textFieldError.copyWith(
                        color: AppColors.textFieldError,
                      ),
                    ),
                  )
                else
                  const Spacer(),
                if (widget.showCounter && widget.maxLength != null)
                  Text(
                    '${_controller.text.length}/${widget.maxLength}',
                    style: AppTextStyles.textFieldCounter.copyWith(
                      color: AppColors.textFieldPlaceholder,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

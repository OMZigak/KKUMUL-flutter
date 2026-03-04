import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// A date picker field widget that displays selected date
/// and opens a date picker dialog when tapped.
class DateField extends StatefulWidget {
  const DateField({
    super.key,
    this.label,
    this.hintText = '날짜 선택',
    this.selectedDate,
    this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
    this.errorText,
    this.width = 163,
    this.height = 48,
    this.dateFormat,
  });

  /// Label text displayed above the field
  final String? label;

  /// Hint text displayed when no date is selected
  final String hintText;

  /// Currently selected date
  final DateTime? selectedDate;

  /// Callback when a date is selected
  final ValueChanged<DateTime>? onDateSelected;

  /// The earliest allowable date
  final DateTime? firstDate;

  /// The latest allowable date
  final DateTime? lastDate;

  /// Whether the field is enabled
  final bool enabled;

  /// Error text displayed below the field
  final String? errorText;

  /// Width of the field
  final double width;

  /// Height of the field
  final double height;

  /// Custom date format function
  final String Function(DateTime)? dateFormat;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  bool _isFocused = false;

  bool get _hasError => widget.errorText != null && widget.errorText!.isNotEmpty;
  bool get _hasValue => widget.selectedDate != null;

  Color get _borderColor {
    if (_hasError) return AppColors.textFieldBorderError;
    if (_isFocused) return AppColors.textFieldBorderFocused;
    return AppColors.textFieldBorderDefault;
  }

  Color get _textColor {
    if (!widget.enabled) return AppColors.textFieldDisabledText;
    if (_hasValue) return AppColors.textFieldText;
    return AppColors.textFieldPlaceholder;
  }

  Color get _backgroundColor {
    if (!widget.enabled) return AppColors.textFieldDisabledBg;
    return AppColors.white;
  }

  Color get _iconColor {
    if (!widget.enabled) return AppColors.textFieldDisabledText;
    if (_isFocused) return AppColors.textFieldText;
    return AppColors.textFieldBorderDefault;
  }

  String get _displayText {
    if (widget.selectedDate == null) return widget.hintText;
    if (widget.dateFormat != null) {
      return widget.dateFormat!(widget.selectedDate!);
    }
    final date = widget.selectedDate!;
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _showDatePicker() async {
    if (!widget.enabled) return;

    setState(() => _isFocused = true);

    final now = DateTime.now();
    final firstDate = widget.firstDate ?? DateTime(now.year - 100);
    final lastDate = widget.lastDate ?? DateTime(now.year + 100);
    final initialDate = widget.selectedDate ?? now;

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate.isAfter(lastDate)
          ? lastDate
          : (initialDate.isBefore(firstDate) ? firstDate : initialDate),
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.mainColor,
                  onPrimary: AppColors.white,
                  surface: AppColors.white,
                  onSurface: AppColors.textFieldText,
                ),
          ),
          child: child!,
        );
      },
    );

    setState(() => _isFocused = false);

    if (selectedDate != null) {
      widget.onDateSelected?.call(selectedDate);
    }
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
              color: _hasError
                  ? AppColors.textFieldError
                  : (widget.enabled
                      ? AppColors.textFieldText
                      : AppColors.textFieldDisabledText),
            ),
          ),
          const SizedBox(height: 8),
        ],
        GestureDetector(
          onTap: _showDatePicker,
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: _backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _borderColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _displayText,
                    style: AppTextStyles.textFieldInput.copyWith(
                      color: _textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: _iconColor,
                ),
              ],
            ),
          ),
        ),
        if (_hasError) ...[
          const SizedBox(height: 4),
          SizedBox(
            width: widget.width,
            child: Text(
              widget.errorText!,
              style: AppTextStyles.textFieldError.copyWith(
                color: AppColors.textFieldError,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// A time picker field widget that displays selected time
/// and opens a time picker dialog when tapped.
class TimeField extends StatefulWidget {
  const TimeField({
    super.key,
    this.label,
    this.hintText = '시간 선택',
    this.selectedTime,
    this.onTimeSelected,
    this.enabled = true,
    this.errorText,
    this.width = 163,
    this.height = 48,
    this.timeFormat,
    this.use24HourFormat = false,
  });

  /// Label text displayed above the field
  final String? label;

  /// Hint text displayed when no time is selected
  final String hintText;

  /// Currently selected time
  final TimeOfDay? selectedTime;

  /// Callback when a time is selected
  final ValueChanged<TimeOfDay>? onTimeSelected;

  /// Whether the field is enabled
  final bool enabled;

  /// Error text displayed below the field
  final String? errorText;

  /// Width of the field
  final double width;

  /// Height of the field
  final double height;

  /// Custom time format function
  final String Function(TimeOfDay)? timeFormat;

  /// Whether to use 24-hour format
  final bool use24HourFormat;

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  bool _isFocused = false;

  bool get _hasError => widget.errorText != null && widget.errorText!.isNotEmpty;
  bool get _hasValue => widget.selectedTime != null;

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
    if (widget.selectedTime == null) return widget.hintText;
    if (widget.timeFormat != null) {
      return widget.timeFormat!(widget.selectedTime!);
    }
    return _formatTime(widget.selectedTime!);
  }

  String _formatTime(TimeOfDay time) {
    if (widget.use24HourFormat) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }

    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? '오전' : '오후';
    return '$period ${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _showTimePicker() async {
    if (!widget.enabled) return;

    setState(() => _isFocused = true);

    final initialTime = widget.selectedTime ?? TimeOfDay.now();

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.mainColor,
                  onPrimary: AppColors.white,
                  surface: AppColors.white,
                  onSurface: AppColors.textFieldText,
                ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.white,
              hourMinuteColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.subColor;
                }
                return AppColors.gray1;
              }),
              hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.mainColor;
                }
                return AppColors.textFieldText;
              }),
              dialHandColor: AppColors.mainColor,
              dialBackgroundColor: AppColors.gray1,
              dialTextColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.white;
                }
                return AppColors.textFieldText;
              }),
              entryModeIconColor: AppColors.mainColor,
            ),
          ),
          child: child!,
        );
      },
    );

    setState(() => _isFocused = false);

    if (selectedTime != null) {
      widget.onTimeSelected?.call(selectedTime);
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
          onTap: _showTimePicker,
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
                  Icons.access_time_outlined,
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

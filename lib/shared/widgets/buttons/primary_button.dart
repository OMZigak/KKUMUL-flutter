import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// Primary button component (btn_ios)
///
/// States:
/// - disabled: grey background (#DFDFDF)
/// - enabled: green background (#0FD380)
/// - pressed: dark green background (#00A775)
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.width = 335,
    this.height = 52,
  });

  /// Button text
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Button width
  final double width;

  /// Button height
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(8),
          highlightColor: AppColors.primaryPressed,
          splashColor: AppColors.primaryPressed.withValues(alpha: 0.3),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppTextStyles.buttonPrimary.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    if (!isEnabled) {
      return AppColors.disabled;
    }
    return AppColors.primary;
  }
}

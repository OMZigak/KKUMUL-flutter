import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';

/// Toggle switch component (my_btn_tgl)
///
/// States:
/// - on: green track (#0FD380), white thumb
/// - off: grey track (#DFDFDF), white thumb
///
/// Size: width 46, height 27
class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.isOn,
    this.onChanged,
    this.width = 46,
    this.height = 27,
  });

  /// Whether the toggle is on
  final bool isOn;

  /// Callback when toggle state changes
  final ValueChanged<bool>? onChanged;

  /// Toggle width
  final double width;

  /// Toggle height
  final double height;

  @override
  Widget build(BuildContext context) {
    final thumbSize = height - 4;
    final thumbPosition = isOn ? width - thumbSize - 2 : 2.0;

    return GestureDetector(
      onTap: () => onChanged?.call(!isOn),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isOn ? AppColors.toggleOn : AppColors.toggleOff,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: thumbPosition,
              top: 2,
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: BoxDecoration(
                  color: AppColors.toggleThumb,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

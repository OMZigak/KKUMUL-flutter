import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// State button state
enum StateButtonState {
  /// Disabled state
  disabled,

  /// Ready to start
  start,

  /// In progress (moving)
  ing,

  /// Arrived
  arrive,
}

/// State button component (btn_state)
///
/// States:
/// - disabled: grey, not interactive
/// - start: ready to start, shows "출발" text
/// - ing: in progress, shows time remaining
/// - arrive: arrived, shows arrival time
///
/// Size: width 84, height 32, borderRadius 20
class StateButton extends StatelessWidget {
  const StateButton({
    super.key,
    required this.state,
    this.timeText,
    this.onPressed,
    this.width = 84,
    this.height = 32,
  });

  /// Button state
  final StateButtonState state;

  /// Time text to display (for ing/arrive states)
  final String? timeText;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button width
  final double width;

  /// Button height
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isInteractive ? onPressed : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showReadyIndicator) ...[
              _buildReadyIndicator(),
              const SizedBox(width: 6),
            ],
            Text(
              _buttonText,
              style: AppTextStyles.buttonState.copyWith(
                color: _textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isInteractive {
    return state == StateButtonState.start;
  }

  bool get _showReadyIndicator {
    return state == StateButtonState.start;
  }

  Color get _backgroundColor {
    switch (state) {
      case StateButtonState.disabled:
        return AppColors.disabled;
      case StateButtonState.start:
        return AppColors.primaryLight;
      case StateButtonState.ing:
        return AppColors.primary;
      case StateButtonState.arrive:
        return AppColors.primaryPressed;
    }
  }

  Color get _textColor {
    switch (state) {
      case StateButtonState.disabled:
        return AppColors.grey;
      case StateButtonState.start:
        return AppColors.primary;
      case StateButtonState.ing:
        return AppColors.white;
      case StateButtonState.arrive:
        return AppColors.white;
    }
  }

  String get _buttonText {
    switch (state) {
      case StateButtonState.disabled:
        return '대기중';
      case StateButtonState.start:
        return '출발';
      case StateButtonState.ing:
        return timeText ?? '이동중';
      case StateButtonState.arrive:
        return timeText ?? '도착';
    }
  }

  Widget _buildReadyIndicator() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
    );
  }
}

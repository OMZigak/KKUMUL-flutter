import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// Progress bar widget (progrbar_ios)
/// Stages: 1, 2, 3, 4
/// Size: width 375, height 4
/// Background: #EFEFEF (gray1)
/// Progress: #0FD380 (mainColor)
class AppProgressBar extends StatelessWidget {
  final int currentStage; // 1-4
  final int totalStages;

  const AppProgressBar({
    required this.currentStage,
    this.totalStages = 4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate progress (0.0 to 1.0)
    final progress = currentStage / totalStages;

    return Container(
      width: double.infinity,
      height: 4,
      color: AppColors.gray1,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}

/// Animated progress bar with smooth transitions
class AppAnimatedProgressBar extends StatelessWidget {
  final int currentStage; // 1-4
  final int totalStages;
  final Duration duration;

  const AppAnimatedProgressBar({
    required this.currentStage,
    this.totalStages = 4,
    this.duration = const Duration(milliseconds: 300),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = currentStage / totalStages;

    return Container(
      width: double.infinity,
      height: 4,
      color: AppColors.gray1,
      child: AnimatedFractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        duration: duration,
        curve: Curves.easeInOut,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}

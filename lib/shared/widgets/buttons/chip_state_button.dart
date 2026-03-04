import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// Chip state type
enum ChipStateType {
  /// Before state (not started)
  before,

  /// Ready state (preparing)
  ready,

  /// Move state (in progress)
  move,

  /// Arrive state (completed)
  arrive,
}

/// Status chip component (grp_chip_state)
///
/// States:
/// - Before: grey background, grey text
/// - Ready: yellow/orange background, orange text
/// - Move: light green background, green text
/// - Arrive: darker green background, dark green text
///
/// Size: width 68, height 28
class ChipStateButton extends StatelessWidget {
  const ChipStateButton({
    super.key,
    required this.type,
    this.width = 68,
    this.height = 28,
  });

  /// Chip state type
  final ChipStateType type;

  /// Chip width
  final double width;

  /// Chip height
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(
        _chipText,
        style: AppTextStyles.chipState.copyWith(
          color: _textColor,
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (type) {
      case ChipStateType.before:
        return AppColors.chipBefore;
      case ChipStateType.ready:
        return AppColors.chipReady;
      case ChipStateType.move:
        return AppColors.chipMove;
      case ChipStateType.arrive:
        return AppColors.chipArrive;
    }
  }

  Color get _textColor {
    switch (type) {
      case ChipStateType.before:
        return AppColors.chipBeforeText;
      case ChipStateType.ready:
        return AppColors.chipReadyText;
      case ChipStateType.move:
        return AppColors.chipMoveText;
      case ChipStateType.arrive:
        return AppColors.chipArriveText;
    }
  }

  String get _chipText {
    switch (type) {
      case ChipStateType.before:
        return '준비전';
      case ChipStateType.ready:
        return '준비중';
      case ChipStateType.move:
        return '이동중';
      case ChipStateType.arrive:
        return '도착';
    }
  }
}

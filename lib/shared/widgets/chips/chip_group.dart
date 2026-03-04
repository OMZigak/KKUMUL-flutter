import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// Group chip widget
/// Background: #D4F7E8 (green2)
/// Text: #00A775 (green3), Pretendard Regular 12px
/// Size: height 24, horizontal padding 8, borderRadius 100
class ChipGroup extends StatelessWidget {
  final String text;

  const ChipGroup({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.green2,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.chipGroup,
        ),
      ),
    );
  }
}

/// Level chip size variants
enum LevelChipSize { small, large }

/// Level chip widget for home and mypage
/// small: home_chip_lv_small
/// large: mypage_chip_lv_large
class LevelChip extends StatelessWidget {
  final int level;
  final LevelChipSize size;

  const LevelChip({
    required this.level,
    this.size = LevelChipSize.small,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmall = size == LevelChipSize.small;
    final height = isSmall ? 20.0 : 28.0;
    final horizontalPadding = isSmall ? 6.0 : 10.0;
    final fontSize = isSmall ? 10.0 : 14.0;

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: AppColors.green2,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          'Lv.$level',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: AppColors.green3,
          ),
        ),
      ),
    );
  }
}

/// Home level chip (small variant)
class HomeLevelChip extends StatelessWidget {
  final int level;

  const HomeLevelChip({
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LevelChip(
      level: level,
      size: LevelChipSize.small,
    );
  }
}

/// MyPage level chip (large variant)
class MyPageLevelChip extends StatelessWidget {
  final int level;

  const MyPageLevelChip({
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LevelChip(
      level: level,
      size: LevelChipSize.large,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// Alarm banner widget (readyinfo_bnr_alarm)
/// Background: #ECFCF5 (green1)
/// Size: width 335, height 114, borderRadius 8
/// Contains preparation time info and edit button
class AlarmBanner extends StatelessWidget {
  final String prepareTime;
  final String moveTime;
  final VoidCallback? onEditPressed;

  const AlarmBanner({
    required this.prepareTime,
    required this.moveTime,
    this.onEditPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 114,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.green1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with title and edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    color: AppColors.mainColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '준비 알림',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              if (onEditPressed != null)
                GestureDetector(
                  onTap: onEditPressed,
                  child: Text(
                    '수정',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Time info rows
          _TimeInfoRow(
            label: '준비 시간',
            value: prepareTime,
          ),
          const SizedBox(height: 8),
          _TimeInfoRow(
            label: '이동 시간',
            value: moveTime,
          ),
        ],
      ),
    );
  }
}

class _TimeInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _TimeInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

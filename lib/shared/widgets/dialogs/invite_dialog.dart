import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// Invite dialog widget (addgrp_popup_invite)
/// Background white, borderRadius 8
/// Size: width 310, height 254
/// Contains title, description, invite code, two buttons
class InviteDialog extends StatelessWidget {
  final String inviteCode;
  final VoidCallback? onLaterPressed;
  final VoidCallback? onCopyPressed;

  const InviteDialog({
    required this.inviteCode,
    this.onLaterPressed,
    this.onCopyPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 310,
        height: 254,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              '초대 코드 공유하기',
              style: AppTextStyles.dialogTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              '친구에게 초대 코드를 공유해\n함께 모임에 참여하세요!',
              style: AppTextStyles.dialogBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Invite code box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: AppColors.gray1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                inviteCode,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Buttons row
            Row(
              children: [
                // Later button
                Expanded(
                  child: GestureDetector(
                    onTap: onLaterPressed ?? () => Navigator.of(context).pop(),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.gray1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '나중에',
                          style: AppTextStyles.buttonPrimary.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Copy button
                Expanded(
                  child: GestureDetector(
                    onTap: onCopyPressed,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '코드 복사',
                          style: AppTextStyles.buttonPrimary.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Shows the invite dialog
  static Future<void> show(
    BuildContext context, {
    required String inviteCode,
    VoidCallback? onLaterPressed,
    VoidCallback? onCopyPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => InviteDialog(
        inviteCode: inviteCode,
        onLaterPressed: onLaterPressed,
        onCopyPressed: onCopyPressed,
      ),
    );
  }
}

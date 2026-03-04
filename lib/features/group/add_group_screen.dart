import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';
import 'package:kkumul/shared/widgets/navigation/navigation.dart';

/// AddGroupScreen - Screen for choosing how to add a group
/// User can either enter an invite code or create a new group
class AddGroupScreen extends StatelessWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar
          AppTopBar(
            title: '내 모임 추가하기',
            onBackPressed: () => context.pop(),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // Title
                Text(
                  '친구에게 받은\n모임 초대 코드가 있으신가요?',
                  style: AppTextStyles.headline2.copyWith(
                    fontSize: 22,
                    letterSpacing: -0.44,
                  ),
                ),

                const SizedBox(height: 16),

                // Option cards
                Column(
                  children: [
                    // Card 1: Enter invite code
                    _OptionCard(
                      subtitle: '초대 코드를 받았다면',
                      title: '초대 코드 입력하기',
                      onTap: () => context.push('/groups/invite-code'),
                    ),

                    const SizedBox(height: 12),

                    // Card 2: Create group directly
                    _OptionCard(
                      subtitle: '초대 코드가 없다면',
                      title: '직접 모임 추가하기',
                      onTap: () => context.push('/groups/create'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Option card widget for selecting how to add a group
class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.subtitle,
    required this.title,
    required this.onTap,
  });

  final String subtitle;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 76,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.green1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subtitle,
                    style: AppTextStyles.caption02.copyWith(
                      color: AppColors.gray5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: AppTextStyles.body03.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Arrow icon
            const Icon(
              Icons.chevron_right,
              color: AppColors.gray3,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

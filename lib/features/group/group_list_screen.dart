import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';
import 'package:kkumul/shared/widgets/navigation/top_bar.dart';

/// Dummy group data model
class _GroupData {
  final String id;
  final String name;
  final int memberCount;
  final String? nextAppointmentName;
  final String? nextAppointmentDate;

  const _GroupData({
    required this.id,
    required this.name,
    required this.memberCount,
    this.nextAppointmentName,
    this.nextAppointmentDate,
  });
}

/// Group list screen (내 모임)
/// Displays a list of groups the user has joined
/// Shows empty state when no groups exist
class GroupListScreen extends StatefulWidget {
  const GroupListScreen({super.key});

  @override
  State<GroupListScreen> createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  // Dummy data - toggle this to see empty vs filled state
  final List<_GroupData> _groups = [
    const _GroupData(
      id: '1',
      name: '대학 동기 모임',
      memberCount: 5,
      nextAppointmentName: '정기 모임',
      nextAppointmentDate: '2024.06.15',
    ),
    const _GroupData(
      id: '2',
      name: '개발 스터디',
      memberCount: 4,
      nextAppointmentName: '코드 리뷰',
      nextAppointmentDate: '2024.06.20',
    ),
    const _GroupData(
      id: '3',
      name: '동네 친구들',
      memberCount: 8,
      nextAppointmentName: null,
      nextAppointmentDate: null,
    ),
  ];

  // Set to true to see empty state
  final bool _showEmptyState = false;

  List<_GroupData> get _displayGroups => _showEmptyState ? [] : _groups;

  String get _userName => '꾸물리안';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray0,
      body: Column(
        children: [
          // Top bar
          AppTopBar(
            title: '내 모임',
            showBackButton: false,
            showMoreButton: true,
            onMorePressed: _onMorePressed,
          ),
          // Content
          Expanded(
            child: _displayGroups.isEmpty
                ? _buildEmptyState()
                : _buildFilledState(),
          ),
        ],
      ),
    );
  }

  void _onMorePressed() {
    // TODO: Show more options
  }

  void _onAddGroupPressed() {
    context.push('/groups/add');
  }

  void _onGroupTapped(String groupId) {
    context.push('/groups/$groupId');
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Header text
            _buildHeaderText(0),
            const SizedBox(height: 44),
            // Add group button
            _buildAddGroupButton(),
            const SizedBox(height: 86),
            // Empty illustration
            _buildEmptyIllustration(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilledState() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Header text
            _buildHeaderText(_displayGroups.length),
            const SizedBox(height: 20),
            // Add group button
            _buildAddGroupButton(),
            const SizedBox(height: 20),
            // Group cards list
            ..._displayGroups.map((group) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildGroupCard(group),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(int count) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 22,
          height: 1.6,
          letterSpacing: -0.44,
          color: AppColors.gray8,
        ),
        children: [
          TextSpan(text: '$_userName님이 가입한 모임은\n'),
          const TextSpan(text: '총 '),
          TextSpan(
            text: '$count개',
            style: const TextStyle(
              color: AppColors.mainColor,
            ),
          ),
          const TextSpan(text: '예요!'),
        ],
      ),
    );
  }

  Widget _buildAddGroupButton() {
    return GestureDetector(
      onTap: _onAddGroupPressed,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.green2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Plus icon
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.green3,
              ),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              '모임 추가하기',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.6,
                letterSpacing: -0.28,
                color: AppColors.green3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyIllustration() {
    return Center(
      child: Column(
        children: [
          // Illustration placeholder
          SizedBox(
            width: 100,
            height: 174,
            child: Column(
              children: [
                // Chat bubbles illustration
                SizedBox(
                  width: 100,
                  height: 52,
                  child: Stack(
                    children: [
                      // Left bubble
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.gray1,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDot(),
                              const SizedBox(width: 4),
                              _buildDot(),
                              const SizedBox(width: 4),
                              _buildDot(),
                            ],
                          ),
                        ),
                      ),
                      // Right bubble
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 50,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.gray1,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDot(),
                              const SizedBox(width: 4),
                              _buildDot(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Character illustration
                Container(
                  width: 100,
                  height: 110,
                  decoration: BoxDecoration(
                    color: AppColors.gray1,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.sentiment_satisfied_alt,
                    size: 60,
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Empty state text
          const Text(
            '아직 모임이 없네요!\n모임을 추가해 보세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.6,
              letterSpacing: -0.28,
              color: AppColors.gray4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray3,
      ),
    );
  }

  Widget _buildGroupCard(_GroupData group) {
    return GestureDetector(
      onTap: () => _onGroupTapped(group.id),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.gray2,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Group name and member count
            Row(
              children: [
                Expanded(
                  child: Text(
                    group.name,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.6,
                      letterSpacing: -0.32,
                      color: AppColors.gray8,
                    ),
                  ),
                ),
                // Member count chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gray1,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.people_outline,
                        size: 14,
                        color: AppColors.gray5,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${group.memberCount}명',
                        style: const TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.6,
                          letterSpacing: -0.24,
                          color: AppColors.gray5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Next appointment info
            if (group.nextAppointmentName != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gray0,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.green2,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        '다음 약속',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          height: 1.6,
                          letterSpacing: -0.2,
                          color: AppColors.green3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        group.nextAppointmentName!,
                        style: const TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.6,
                          letterSpacing: -0.28,
                          color: AppColors.gray7,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      group.nextAppointmentDate ?? '',
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.6,
                        letterSpacing: -0.24,
                        color: AppColors.gray4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

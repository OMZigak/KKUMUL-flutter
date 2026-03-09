import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/constants/app_assets.dart';
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
            const SizedBox(height: 18),
            // Add group button
            _buildAddGroupButton(),
            const SizedBox(height: 94),
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
            // Plus icon (ic_grpplus SVG)
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                AppAssets.icGrpplus,
                width: 20,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.green3,
                  BlendMode.srcIn,
                ),
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
      child: SizedBox(
        width: 258,
        child: Column(
          children: [
            // Empty illustration (bubble + character)
            SizedBox(
              width: 100,
              height: 174,
              child: Column(
                children: [
                  // Chat bubble illustration (emptyBubble)
                  SizedBox(
                    width: 100,
                    height: 52.055,
                    child: SvgPicture.asset(
                      AppAssets.emptyBubble,
                      width: 100,
                      height: 52.055,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Character illustration (emptyGroup)
                  SizedBox(
                    width: 100,
                    height: 109.589,
                    child: SvgPicture.asset(
                      AppAssets.emptyGroup,
                      width: 100,
                      height: 109.589,
                      fit: BoxFit.contain,
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

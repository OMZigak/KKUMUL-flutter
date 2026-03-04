import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/navigation/navigation.dart';
import 'package:kkumul/shared/widgets/buttons/buttons.dart';
import 'package:kkumul/shared/widgets/cards/cards.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// 약속 상세 화면
///
/// 약속의 상세 정보를 표시합니다.
/// - 약속 정보 카드 (날짜, 시간, 장소)
/// - 참여 멤버 리스트
/// - 벌칙 정보 (있을 경우)
/// - "준비 현황 보기" 버튼
class AppointmentDetailScreen extends StatefulWidget {
  /// 약속 ID (path parameter)
  final String appointmentId;

  const AppointmentDetailScreen({
    super.key,
    required this.appointmentId,
  });

  @override
  State<AppointmentDetailScreen> createState() =>
      _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  // TODO: API에서 데이터 불러오기
  // Mock data for demonstration
  final _appointmentData = {
    'name': '주간 스터디 모임',
    'groupName': '개발 스터디',
    'date': DateTime(2024, 3, 15),
    'time': const TimeOfDay(hour: 14, minute: 0),
    'location': '강남역 스타벅스',
    'penalty': '커피 사기',
  };

  final List<Map<String, dynamic>> _members = [
    {'name': '김철수', 'profileUrl': null, 'status': MemberStatus.arrive},
    {'name': '이영희', 'profileUrl': null, 'status': MemberStatus.move},
    {'name': '박민수', 'profileUrl': null, 'status': MemberStatus.ready},
    {'name': '최지우', 'profileUrl': null, 'status': MemberStatus.before},
  ];

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('약속 수정'),
              onTap: () {
                Navigator.pop(context);
                // TODO: 약속 수정 화면으로 이동
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.red),
              title: const Text(
                '약속 삭제',
                style: TextStyle(color: AppColors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('약속 삭제'),
        content: const Text('정말로 이 약속을 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              '취소',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: API 연동 - 약속 삭제
              context.pop();
            },
            child: const Text(
              '삭제',
              style: TextStyle(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPreparation() {
    context.push('/appointments/${widget.appointmentId}/preparation');
  }

  String _formatDate(DateTime date) {
    final weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return '${date.month}월 ${date.day}일 (${weekdays[date.weekday - 1]})';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? '오전' : '오후';
    return '$period $hour:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray0,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // TopBar
            AppTopBar(
              title: _appointmentData['groupName'] as String,
              showBackButton: true,
              showMoreButton: true,
              onBackPressed: () => context.pop(),
              onMorePressed: _showMoreOptions,
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 약속 정보 카드
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 약속 이름
                          Text(
                            _appointmentData['name'] as String,
                            style: AppTextStyles.headline3,
                          ),
                          const SizedBox(height: 16),

                          // 날짜
                          _buildInfoRow(
                            icon: Icons.calendar_today_outlined,
                            text: _formatDate(
                                _appointmentData['date'] as DateTime),
                          ),
                          const SizedBox(height: 12),

                          // 시간
                          _buildInfoRow(
                            icon: Icons.access_time_outlined,
                            text: _formatTime(
                                _appointmentData['time'] as TimeOfDay),
                          ),
                          const SizedBox(height: 12),

                          // 장소
                          _buildInfoRow(
                            icon: Icons.place_outlined,
                            text: _appointmentData['location'] as String,
                          ),
                        ],
                      ),
                    ),

                    // 참여 멤버 섹션
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            '참여 멤버',
                            style: AppTextStyles.body03.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${_members.length}명',
                            style: AppTextStyles.body05.copyWith(
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 멤버 리스트
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: _members.map((member) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: MemberCard(
                              name: member['name'] as String,
                              profileImageUrl: member['profileUrl'] as String?,
                              status: member['status'] as MemberStatus,
                              showStatusChip: true,
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // 벌칙 정보 (있을 경우)
                    if (_appointmentData['penalty'] != null &&
                        (_appointmentData['penalty'] as String).isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.orange.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.warning_amber_rounded,
                                  color: AppColors.orange,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '지각 벌칙',
                                      style: AppTextStyles.caption01.copyWith(
                                        color: AppColors.orange,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      _appointmentData['penalty'] as String,
                                      style: AppTextStyles.body04.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // 하단 버튼
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: PrimaryButton(
                text: '준비 현황 보기',
                width: double.infinity,
                onPressed: _navigateToPreparation,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body04.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

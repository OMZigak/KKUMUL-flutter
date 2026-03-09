import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/navigation/navigation.dart';
import 'package:kkumul/shared/widgets/cards/cards.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// 준비 현황 화면
///
/// Figma node: 1:15620
///
/// 탭바를 통해 약속 정보, 준비 현황, 지각 꾸물이를 전환합니다.
/// - "준비 정보 입력하기" 버튼
/// - "나의 준비 현황" 섹션 (현재 시간, 진행 상태 바)
/// - "우리들의 준비 현황" 섹션 (멤버 카드 리스트)
class PreparationStatusScreen extends StatefulWidget {
  /// 약속 ID (path parameter)
  final String appointmentId;

  const PreparationStatusScreen({
    super.key,
    required this.appointmentId,
  });

  @override
  State<PreparationStatusScreen> createState() =>
      _PreparationStatusScreenState();
}

class _PreparationStatusScreenState extends State<PreparationStatusScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 나의 준비 상태
  int _myProgressStage = 0; // 0: 시작 전, 1: 준비 중, 2: 이동 시작, 3: 도착 완료

  // TODO: API에서 데이터 불러오기
  final _appointmentData = {
    'name': '주간 스터디 모임',
    'groupName': '개발 스터디',
    'date': DateTime(2024, 3, 15),
    'time': const TimeOfDay(hour: 14, minute: 0),
    'location': '강남역 스타벅스',
  };

  final List<Map<String, dynamic>> _members = [
    {'name': '김철수', 'profileUrl': null, 'status': MemberStatus.arrive},
    {'name': '이영희', 'profileUrl': null, 'status': MemberStatus.move},
    {'name': '박민수', 'profileUrl': null, 'status': MemberStatus.ready},
    {'name': '최지우', 'profileUrl': null, 'status': MemberStatus.before},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1, // 준비 현황 탭이 기본
    );
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {});
  }

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
              leading: const Icon(Icons.share_outlined),
              title: const Text('초대 링크 공유'),
              onTap: () {
                Navigator.pop(context);
                // TODO: 초대 링크 공유 기능
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onReadyButtonTap() {
    if (_myProgressStage < 1) {
      setState(() {
        _myProgressStage = 1;
      });
      // TODO: API 연동 - 준비 상태 업데이트
    }
  }

  void _onMoveButtonTap() {
    if (_myProgressStage < 2 && _myProgressStage >= 1) {
      setState(() {
        _myProgressStage = 2;
      });
      // TODO: API 연동 - 이동 상태 업데이트
    }
  }

  void _onArriveButtonTap() {
    if (_myProgressStage < 3 && _myProgressStage >= 2) {
      setState(() {
        _myProgressStage = 3;
      });
      // TODO: API 연동 - 도착 상태 업데이트
    }
  }

  void _navigateToPreparationInput() {
    // TODO: 준비 정보 입력 화면으로 이동
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('준비 정보 입력 화면으로 이동합니다.'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  String _formatCurrentTime() {
    final now = TimeOfDay.now();
    final hour = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
    final period = now.period == DayPeriod.am ? 'AM' : 'PM';
    return '$period ${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  ProgressButtonState _getReadyState() {
    if (_myProgressStage == 0) return ProgressButtonState.start;
    if (_myProgressStage == 1) return ProgressButtonState.inProgress;
    return ProgressButtonState.arrive;
  }

  ProgressButtonState _getMoveState() {
    if (_myProgressStage < 1) return ProgressButtonState.disabled;
    if (_myProgressStage == 1) return ProgressButtonState.start;
    if (_myProgressStage == 2) return ProgressButtonState.inProgress;
    return ProgressButtonState.arrive;
  }

  ProgressButtonState _getArriveState() {
    if (_myProgressStage < 2) return ProgressButtonState.disabled;
    if (_myProgressStage == 2) return ProgressButtonState.start;
    return ProgressButtonState.arrive;
  }

  double _getProgressValue() {
    return _myProgressStage / 3;
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

            // TabBar - Figma: grp_topbar_ios (node 1:15635)
            Container(
              height: 52,
              color: AppColors.white,
              child: Column(
                children: [
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.gray8, // #242424
                      indicatorWeight: 2,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: AppColors.gray8, // #242424
                      unselectedLabelColor: AppColors.gray3, // #C1C1C1
                      labelStyle: AppTextStyles.body05,
                      unselectedLabelStyle: AppTextStyles.body05,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: '약속 정보'),
                        Tab(text: '준비 현황'),
                        Tab(text: '지각 꾸물이'),
                      ],
                    ),
                  ),
                  // Bottom border line
                  Container(
                    height: 1,
                    color: AppColors.gray2,
                  ),
                ],
              ),
            ),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAppointmentInfoTab(),
                  _buildPreparationStatusTab(),
                  _buildLateMembersTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 약속 정보 탭
  Widget _buildAppointmentInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _appointmentData['name'] as String,
              style: AppTextStyles.headline3,
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              icon: Icons.calendar_today_outlined,
              label: '날짜',
              value: _formatDate(_appointmentData['date'] as DateTime),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.access_time_outlined,
              label: '시간',
              value: _formatTime(_appointmentData['time'] as TimeOfDay),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.place_outlined,
              label: '장소',
              value: _appointmentData['location'] as String,
            ),
          ],
        ),
      ),
    );
  }

  /// 준비 현황 탭
  Widget _buildPreparationStatusTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 준비 정보 입력하기 버튼 - Figma: JoinBtnInviteIos type="title" (node 1:15634)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: GestureDetector(
              onTap: _navigateToPreparationInput,
              child: Container(
                width: double.infinity,
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '준비 정보 입력하기',
                        style: AppTextStyles.body03.copyWith(
                          color: AppColors.gray8, // #242424
                        ),
                      ),
                    ),
                    // ic_right arrow icon
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: AppColors.gray3, // #C1C1C1
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 나의 준비 현황 섹션 - Figma node 1:15631
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '나의 준비 현황',
              style: AppTextStyles.body01.copyWith(
                color: AppColors.gray8, // #242424
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Progress Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ProgressCard(
              currentTime: _formatCurrentTime(),
              progressValue: _getProgressValue(),
              readyState: _getReadyState(),
              moveState: _getMoveState(),
              arriveState: _getArriveState(),
              readyLabel: '준비 중',
              moveLabel: '이동 시작',
              arriveLabel: '도착 완료',
              helpMessage: '버튼을 눌러주세요',
              showPopupMessage: _myProgressStage < 3,
              popupMessage: '꾸물거릴 시간이 없어요!',
              onReadyTap: _onReadyButtonTap,
              onMoveTap: _onMoveButtonTap,
              onArriveTap: _onArriveButtonTap,
            ),
          ),

          const SizedBox(height: 16),

          // 우리들의 준비 현황 섹션 - Figma node 1:15623
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '우리들의 준비 현황',
              style: AppTextStyles.body01.copyWith(
                color: AppColors.gray8, // #242424
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 멤버 카드 리스트 - Figma: gap 8px between cards
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

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// 지각 꾸물이 탭
  Widget _buildLateMembersTab() {
    final lateMembers =
        _members.where((m) => m['status'] == MemberStatus.before).toList();

    if (lateMembers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.celebration_outlined,
              size: 64,
              color: AppColors.mainColor,
            ),
            const SizedBox(height: 16),
            Text(
              '지각한 사람이 없어요!',
              style: AppTextStyles.body01.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '모두 제시간에 도착했습니다',
              style: AppTextStyles.body04.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.orange,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  '${lateMembers.length}명이 아직 준비를 시작하지 않았어요',
                  style: AppTextStyles.body05.copyWith(
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...lateMembers.map((member) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: MemberCard(
                name: member['name'] as String,
                profileImageUrl: member['profileUrl'] as String?,
                status: member['status'] as MemberStatus,
                showStatusChip: true,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: AppTextStyles.body06.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.body04.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
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
}

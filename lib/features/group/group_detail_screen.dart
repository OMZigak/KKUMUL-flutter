import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';
import 'package:kkumul/shared/widgets/navigation/top_bar.dart';
import 'package:kkumul/shared/widgets/cards/appointment_card.dart';
import 'package:kkumul/shared/widgets/cards/member_card.dart';

/// Dummy appointment data model
class _AppointmentData {
  final String id;
  final String name;
  final String date;
  final String time;
  final String location;
  final AppointmentDateType dateType;
  final String dDayText;

  const _AppointmentData({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.dateType,
    required this.dDayText,
  });
}

/// Dummy member data model
class _MemberData {
  final String id;
  final String name;
  final String? profileImageUrl;
  final MemberStatus status;
  final int? lateCount;

  const _MemberData({
    required this.id,
    required this.name,
    this.profileImageUrl,
    this.status = MemberStatus.before,
    this.lateCount,
  });
}

/// Group detail screen
/// Displays group information with tabs for appointments, preparation status, and late members
class GroupDetailScreen extends StatefulWidget {
  final String groupId;

  const GroupDetailScreen({
    required this.groupId,
    super.key,
  });

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy group data
  String get _groupName => '대학 동기 모임';

  // Dummy appointments
  final List<_AppointmentData> _appointments = [
    const _AppointmentData(
      id: '1',
      name: '정기 모임',
      date: '2024.06.15',
      time: 'PM 2:00',
      location: '강남역 스타벅스',
      dateType: AppointmentDateType.dDay,
      dDayText: 'D-DAY',
    ),
    const _AppointmentData(
      id: '2',
      name: '영화 관람',
      date: '2024.06.20',
      time: 'PM 7:00',
      location: 'CGV 용산',
      dateType: AppointmentDateType.dMinus,
      dDayText: 'D-5',
    ),
    const _AppointmentData(
      id: '3',
      name: '지난 모임',
      date: '2024.06.01',
      time: 'PM 6:00',
      location: '홍대입구',
      dateType: AppointmentDateType.dPlus,
      dDayText: 'D+14',
    ),
  ];

  // Dummy members for preparation status
  final List<_MemberData> _preparationMembers = [
    const _MemberData(
      id: '1',
      name: '김철수',
      status: MemberStatus.arrive,
    ),
    const _MemberData(
      id: '2',
      name: '이영희',
      status: MemberStatus.move,
    ),
    const _MemberData(
      id: '3',
      name: '박지민',
      status: MemberStatus.ready,
    ),
    const _MemberData(
      id: '4',
      name: '최수현',
      status: MemberStatus.before,
    ),
    const _MemberData(
      id: '5',
      name: '정민수',
      status: MemberStatus.before,
    ),
  ];

  // Dummy members for late list
  final List<_MemberData> _lateMembers = [
    const _MemberData(
      id: '1',
      name: '박지민',
      lateCount: 3,
    ),
    const _MemberData(
      id: '2',
      name: '최수현',
      lateCount: 2,
    ),
    const _MemberData(
      id: '3',
      name: '정민수',
      lateCount: 1,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray0,
      body: Column(
        children: [
          // Top bar
          AppTopBar(
            title: _groupName,
            showBackButton: true,
            showMoreButton: true,
            onBackPressed: () => context.pop(),
            onMorePressed: _onMorePressed,
          ),
          // Tab bar
          _buildTabBar(),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAppointmentsTab(),
                _buildPreparationTab(),
                _buildLateTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMorePressed() {
    // TODO: Show more options
  }

  Widget _buildTabBar() {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray2,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColors.mainColor,
        indicatorWeight: 2,
        labelColor: AppColors.mainColor,
        unselectedLabelColor: AppColors.gray4,
        labelStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 1.6,
          letterSpacing: -0.28,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.6,
          letterSpacing: -0.28,
        ),
        tabs: const [
          Tab(text: '약속 정보'),
          Tab(text: '준비 현황'),
          Tab(text: '지각 꾸물이'),
        ],
      ),
    );
  }

  // ========== Appointments Tab ==========
  Widget _buildAppointmentsTab() {
    if (_appointments.isEmpty) {
      return _buildEmptyAppointments();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add appointment button
          _buildAddAppointmentButton(),
          const SizedBox(height: 20),
          // Appointment cards
          ..._appointments.map((appointment) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildAppointmentCard(appointment),
              )),
        ],
      ),
    );
  }

  Widget _buildEmptyAppointments() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy,
            size: 64,
            color: AppColors.gray3,
          ),
          const SizedBox(height: 16),
          const Text(
            '아직 약속이 없어요.\n새로운 약속을 만들어 보세요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.6,
              letterSpacing: -0.28,
              color: AppColors.gray4,
            ),
          ),
          const SizedBox(height: 24),
          _buildAddAppointmentButton(),
        ],
      ),
    );
  }

  Widget _buildAddAppointmentButton() {
    return GestureDetector(
      onTap: () {
        context.push('/appointments/add?groupId=${widget.groupId}');
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 20,
              color: AppColors.mainColor,
            ),
            const SizedBox(width: 8),
            const Text(
              '약속 추가하기',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.6,
                letterSpacing: -0.28,
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(_AppointmentData appointment) {
    return GestureDetector(
      onTap: () {
        context.push('/appointments/${appointment.id}');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
            // D-day label
            Text(
              appointment.dDayText,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.6,
                letterSpacing: -0.28,
                color: _getDDayColor(appointment.dateType),
              ),
            ),
            const SizedBox(height: 8),
            // Appointment name
            Text(
              appointment.name,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.6,
                letterSpacing: -0.32,
                color: AppColors.gray8,
              ),
            ),
            const SizedBox(height: 12),
            // Info rows
            _buildInfoRow(Icons.calendar_today, appointment.date),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.access_time_filled, appointment.time),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, appointment.location),
          ],
        ),
      ),
    );
  }

  Color _getDDayColor(AppointmentDateType type) {
    switch (type) {
      case AppointmentDateType.dDay:
        return AppColors.orange;
      case AppointmentDateType.dMinus:
        return AppColors.gray5;
      case AppointmentDateType.dPlus:
        return AppColors.gray3;
    }
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.gray7,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.6,
            letterSpacing: -0.28,
            color: AppColors.gray7,
          ),
        ),
      ],
    );
  }

  // ========== Preparation Tab ==========
  Widget _buildPreparationTab() {
    if (_preparationMembers.isEmpty) {
      return _buildEmptyPreparation();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary header
          _buildPreparationSummary(),
          const SizedBox(height: 20),
          // Member cards
          ..._preparationMembers.map((member) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildPreparationMemberCard(member),
              )),
        ],
      ),
    );
  }

  Widget _buildEmptyPreparation() {
    return const Center(
      child: Text(
        '현재 진행 중인 약속이 없어요.',
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.6,
          letterSpacing: -0.28,
          color: AppColors.gray4,
        ),
      ),
    );
  }

  Widget _buildPreparationSummary() {
    final arrivedCount =
        _preparationMembers.where((m) => m.status == MemberStatus.arrive).length;
    final movingCount =
        _preparationMembers.where((m) => m.status == MemberStatus.move).length;
    final readyCount =
        _preparationMembers.where((m) => m.status == MemberStatus.ready).length;
    final beforeCount =
        _preparationMembers.where((m) => m.status == MemberStatus.before).length;

    return Container(
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
          const Text(
            '준비 현황',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.6,
              letterSpacing: -0.32,
              color: AppColors.gray8,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatusChip('도착', arrivedCount, AppColors.green3),
              const SizedBox(width: 8),
              _buildStatusChip('이동중', movingCount, AppColors.mainColor),
              const SizedBox(width: 8),
              _buildStatusChip('준비중', readyCount, AppColors.orange),
              const SizedBox(width: 8),
              _buildStatusChip('꾸물중', beforeCount, AppColors.gray3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 1.6,
                letterSpacing: -0.36,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.6,
                letterSpacing: -0.24,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreparationMemberCard(_MemberData member) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            // Profile image
            _buildProfileImage(member),
            const SizedBox(width: 12),
            // Name
            Expanded(
              child: Text(
                member.name,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.6,
                  letterSpacing: -0.32,
                  color: AppColors.black,
                ),
              ),
            ),
            // Status chip
            _buildMemberStatusChip(member.status),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(_MemberData member) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray2,
      ),
      child: ClipOval(
        child: member.profileImageUrl != null
            ? Image.network(
                member.profileImageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildDefaultProfileIcon();
                },
              )
            : _buildDefaultProfileIcon(),
      ),
    );
  }

  Widget _buildDefaultProfileIcon() {
    return Container(
      color: AppColors.gray2,
      child: const Center(
        child: Icon(
          Icons.person,
          size: 24,
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget _buildMemberStatusChip(MemberStatus status) {
    final label = _getStatusLabel(status);
    final backgroundColor = _getStatusBackgroundColor(status);
    final textColor = _getStatusTextColor(status);
    final borderColor = _getStatusBorderColor(status);

    return Container(
      width: 68,
      height: 28,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.6,
            letterSpacing: -0.28,
            color: textColor,
          ),
        ),
      ),
    );
  }

  String _getStatusLabel(MemberStatus status) {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return '꾸물중';
      case MemberStatus.move:
        return '이동중';
      case MemberStatus.arrive:
        return '도착';
    }
  }

  Color _getStatusBackgroundColor(MemberStatus status) {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return AppColors.white;
      case MemberStatus.move:
      case MemberStatus.arrive:
        return AppColors.green2;
    }
  }

  Color _getStatusTextColor(MemberStatus status) {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return AppColors.gray3;
      case MemberStatus.move:
      case MemberStatus.arrive:
        return AppColors.mainColor;
    }
  }

  Color _getStatusBorderColor(MemberStatus status) {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return AppColors.gray3;
      case MemberStatus.move:
      case MemberStatus.arrive:
        return Colors.transparent;
    }
  }

  // ========== Late Tab ==========
  Widget _buildLateTab() {
    if (_lateMembers.isEmpty) {
      return _buildEmptyLate();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            '지각 랭킹',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.6,
              letterSpacing: -0.32,
              color: AppColors.gray8,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '지각을 가장 많이 한 멤버들이에요.',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.6,
              letterSpacing: -0.28,
              color: AppColors.gray5,
            ),
          ),
          const SizedBox(height: 20),
          // Late member cards
          ...List.generate(_lateMembers.length, (index) {
            final member = _lateMembers[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _buildLateMemberCard(member, index + 1),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildEmptyLate() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 64,
            color: AppColors.mainColor,
          ),
          const SizedBox(height: 16),
          const Text(
            '아직 지각한 멤버가 없어요!\n모두 시간 약속을 잘 지키고 있네요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
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

  Widget _buildLateMemberCard(_MemberData member, int rank) {
    Color rankColor;
    IconData? rankIcon;

    switch (rank) {
      case 1:
        rankColor = const Color(0xFFFFD643); // gold
        rankIcon = Icons.emoji_events;
        break;
      case 2:
        rankColor = AppColors.gray3; // silver
        rankIcon = Icons.emoji_events;
        break;
      case 3:
        rankColor = const Color(0xFFCD7F32); // bronze
        rankIcon = Icons.emoji_events;
        break;
      default:
        rankColor = AppColors.gray5;
        rankIcon = null;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: rank <= 3 ? rankColor.withValues(alpha: 0.5) : AppColors.gray2,
          width: rank <= 3 ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: rankColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: rankIcon != null
                  ? Icon(
                      rankIcon,
                      size: 18,
                      color: rankColor,
                    )
                  : Text(
                      '$rank',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.6,
                        letterSpacing: -0.28,
                        color: rankColor,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          // Profile image
          _buildProfileImage(member),
          const SizedBox(width: 12),
          // Name
          Expanded(
            child: Text(
              member.name,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.6,
                letterSpacing: -0.32,
                color: AppColors.black,
              ),
            ),
          ),
          // Late count
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              '${member.lateCount}회 지각',
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.6,
                letterSpacing: -0.24,
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

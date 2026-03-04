import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/buttons/toggle_button.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// 마이페이지 화면
///
/// 프로필 정보, 통계, 설정 메뉴 등을 표시하는 화면입니다.
class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          '마이페이지',
          style: AppTextStyles.topBarTitle,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 프로필 섹션
            _buildProfileSection(),
            const SizedBox(height: 24),
            // 통계 섹션
            _buildStatisticsSection(),
            const SizedBox(height: 24),
            const Divider(height: 8, thickness: 8, color: AppColors.gray0),
            // 메뉴 리스트
            _buildMenuList(),
            // 앱 버전
            _buildVersionInfo(),
          ],
        ),
      ),
    );
  }

  /// 프로필 섹션 빌드
  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          // 프로필 이미지
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.gray1,
            child: Icon(
              Icons.person,
              size: 48,
              color: AppColors.gray4,
            ),
          ),
          const SizedBox(height: 16),
          // 닉네임
          Text(
            '꾸물리안',
            style: AppTextStyles.body01.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          // 프로필 수정 버튼
          OutlinedButton(
            onPressed: () {
              // TODO: 프로필 수정 화면으로 이동
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.gray2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Text(
              '프로필 수정',
              style: AppTextStyles.caption02.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 통계 섹션 빌드
  Widget _buildStatisticsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.gray0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('총 약속', '12'),
          _buildVerticalDivider(),
          _buildStatItem('정시 도착', '8'),
          _buildVerticalDivider(),
          _buildStatItem('지각', '4'),
        ],
      ),
    );
  }

  /// 통계 아이템 빌드
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.body01.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption02.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  /// 세로 구분선 빌드
  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 40,
      color: AppColors.gray2,
    );
  }

  /// 메뉴 리스트 빌드
  Widget _buildMenuList() {
    return Column(
      children: [
        // 알림 설정 (토글)
        _buildMenuItemWithToggle(
          title: '알림 설정',
          isOn: _isNotificationEnabled,
          onChanged: (value) {
            setState(() {
              _isNotificationEnabled = value;
            });
          },
        ),
        _buildDivider(),
        // 준비 시간 설정
        _buildMenuItem(
          title: '준비 시간 설정',
          onTap: () {
            // TODO: 준비 시간 설정 화면으로 이동
          },
        ),
        _buildDivider(),
        // 이동 시간 설정
        _buildMenuItem(
          title: '이동 시간 설정',
          onTap: () {
            // TODO: 이동 시간 설정 화면으로 이동
          },
        ),
        _buildDivider(),
        // 공지사항
        _buildMenuItem(
          title: '공지사항',
          onTap: () {
            // TODO: 공지사항 화면으로 이동
          },
        ),
        _buildDivider(),
        // 문의하기
        _buildMenuItem(
          title: '문의하기',
          onTap: () {
            // TODO: 문의하기 화면으로 이동
          },
        ),
        _buildDivider(),
        // 이용약관
        _buildMenuItem(
          title: '이용약관',
          onTap: () {
            // TODO: 이용약관 화면으로 이동
          },
        ),
        _buildDivider(),
        // 개인정보처리방침
        _buildMenuItem(
          title: '개인정보처리방침',
          onTap: () {
            // TODO: 개인정보처리방침 화면으로 이동
          },
        ),
        _buildDivider(),
        // 로그아웃
        _buildMenuItem(
          title: '로그아웃',
          isDestructive: true,
          showArrow: false,
          onTap: () {
            _showLogoutDialog();
          },
        ),
        _buildDivider(),
        // 회원탈퇴
        _buildMenuItem(
          title: '회원탈퇴',
          isDestructive: true,
          showArrow: false,
          onTap: () {
            _showWithdrawDialog();
          },
        ),
      ],
    );
  }

  /// 메뉴 아이템 빌드
  Widget _buildMenuItem({
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.body04.copyWith(
                color: isDestructive ? AppColors.red : AppColors.textPrimary,
              ),
            ),
            if (showArrow)
              Icon(
                Icons.chevron_right,
                color: AppColors.gray4,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  /// 토글이 있는 메뉴 아이템 빌드
  Widget _buildMenuItemWithToggle({
    required String title,
    required bool isOn,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.body04.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          ToggleButton(
            isOn: isOn,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  /// 구분선 빌드
  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.gray1,
      indent: 20,
      endIndent: 20,
    );
  }

  /// 버전 정보 빌드
  Widget _buildVersionInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        '버전 1.0.0',
        style: AppTextStyles.caption02.copyWith(
          color: AppColors.textTertiary,
        ),
      ),
    );
  }

  /// 로그아웃 확인 다이얼로그
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          '로그아웃',
          style: AppTextStyles.dialogTitle,
        ),
        content: Text(
          '정말 로그아웃 하시겠습니까?',
          style: AppTextStyles.dialogBody,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              '취소',
              style: AppTextStyles.body05.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: 로그아웃 처리
            },
            child: Text(
              '로그아웃',
              style: AppTextStyles.body05.copyWith(
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 회원탈퇴 확인 다이얼로그
  void _showWithdrawDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          '회원탈퇴',
          style: AppTextStyles.dialogTitle,
        ),
        content: Text(
          '정말 탈퇴하시겠습니까?\n탈퇴 시 모든 데이터가 삭제됩니다.',
          style: AppTextStyles.dialogBody,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              '취소',
              style: AppTextStyles.body05.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: 회원탈퇴 처리
            },
            child: Text(
              '탈퇴하기',
              style: AppTextStyles.body05.copyWith(
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkumul/shared/constants/app_assets.dart';
import 'package:kkumul/shared/widgets/buttons/toggle_button.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// 마이페이지 화면
///
/// Figma design node: 1:16031
/// 프로필 정보, 레벨 칩, 푸시 알림 설정, 설정 메뉴 등을 표시하는 화면입니다.
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
          style: AppTextStyles.body03.copyWith(
            color: AppColors.gray8,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: AppColors.gray1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 배경색 green1 영역
            Container(
              color: AppColors.green1,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // 프로필 섹션
                  _buildProfileSection(),
                  const SizedBox(height: 12),
                  // 레벨 칩
                  _buildLevelChip(),
                  const SizedBox(height: 35),
                ],
              ),
            ),
            // 구분 바 (green2)
            Container(
              height: 6,
              color: AppColors.green2,
            ),
            // 푸시 알림 카드
            Container(
              color: AppColors.green1,
              padding: const EdgeInsets.fromLTRB(20, 31, 20, 12),
              child: _buildNotificationCard(),
            ),
            // 설정 메뉴 카드
            Container(
              color: AppColors.green1,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: _buildSettingsCard(),
            ),
          ],
        ),
      ),
    );
  }

  /// 프로필 섹션 빌드
  Widget _buildProfileSection() {
    return Column(
      children: [
        // 프로필 이미지 (82x82) + 편집 버튼
        Stack(
          children: [
            // 프로필 이미지
            SizedBox(
              width: 82,
              height: 82,
              child: SvgPicture.asset(
                AppAssets.profileDefault,
                fit: BoxFit.cover,
              ),
            ),
            // 편집 버튼 (오른쪽 하단)
            Positioned(
              right: -1,
              bottom: -1,
              child: GestureDetector(
                onTap: () {
                  // TODO: 프로필 수정 화면으로 이동
                },
                child: SvgPicture.asset(
                  AppAssets.icEditProfile,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // 닉네임
        Text(
          '꾸물리안 님',
          style: AppTextStyles.body01.copyWith(
            color: AppColors.gray8,
          ),
        ),
      ],
    );
  }

  /// 레벨 칩 빌드
  Widget _buildLevelChip() {
    return Container(
      width: 208,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: AppColors.mainColor,
          width: 1,
        ),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: AppTextStyles.body05.copyWith(
              color: AppColors.white,
            ),
            children: const [
              TextSpan(
                text: 'Lv. 1',
                style: TextStyle(
                  color: Color(0xFFEAFF84), // 노란색 (Figma 스펙)
                ),
              ),
              TextSpan(
                text: ' 지각대장 꾸물이',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 푸시 알림 카드 빌드
  Widget _buildNotificationCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.gray1,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 텍스트 영역
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '내 푸쉬 알림',
                  style: AppTextStyles.body03.copyWith(
                    color: AppColors.gray7,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '준비, 이동을 시작해야할 시간에\n푸쉬 알림을 받을 수 있습니다.',
                  style: AppTextStyles.caption02.copyWith(
                    color: AppColors.gray6,
                  ),
                ),
              ],
            ),
          ),
          // 토글 버튼
          ToggleButton(
            isOn: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  /// 설정 메뉴 카드 빌드
  Widget _buildSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.gray1,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 버전정보
          _buildSettingsMenuItem(
            title: '버전정보',
            trailing: Text(
              '0.1.0',
              style: AppTextStyles.body03.copyWith(
                color: AppColors.gray8,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // 이용약관
          _buildSettingsMenuItem(
            title: '이용약관',
            onTap: () {
              // TODO: 이용약관 화면으로 이동
            },
          ),
          const SizedBox(height: 12),
          // 로그아웃
          _buildSettingsMenuItem(
            title: '로그아웃',
            onTap: () {
              _showLogoutDialog();
            },
          ),
          const SizedBox(height: 12),
          // 탈퇴하기
          _buildSettingsMenuItem(
            title: '탈퇴하기',
            onTap: () {
              _showWithdrawDialog();
            },
          ),
        ],
      ),
    );
  }

  /// 설정 메뉴 아이템 빌드
  Widget _buildSettingsMenuItem({
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.body03.copyWith(
                color: AppColors.gray7,
              ),
            ),
            if (trailing != null) trailing,
          ],
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
          '탈퇴하기',
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

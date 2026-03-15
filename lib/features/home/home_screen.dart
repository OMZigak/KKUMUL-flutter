import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';
import 'package:kkumul/shared/widgets/cards/home_appointment_card.dart';
import 'package:kkumul/shared/widgets/cards/appointment_card.dart';
import 'package:kkumul/shared/constants/app_assets.dart';

/// Home screen for the Kkumul app (홈_1단계)
///
/// Matches Figma node 1:15377 exactly
/// Screen size: 375 x 812
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Green header section (fixed height based on Figma: 397px)
            _buildGreenHeader(),
            // White content section with rounded top
            _buildWhiteContent(),
          ],
        ),
      ),
    );
  }

  /// Green header section - matches Figma exactly
  /// Total height: ~397px (from top to where white section starts)
  Widget _buildGreenHeader() {
    return Container(
      height: 397,
      color: AppColors.mainColor,
      child: Stack(
        children: [
          // Status bar area (44px)
          // Logo - position: left=20, top=58, size=64x24
          Positioned(
            left: 20,
            top: 58,
            child: _buildLogo(),
          ),
          // Welcome message - position: left=20, top=106
          Positioned(
            left: 20,
            top: 106,
            child: _buildWelcomeMessage(),
          ),
          // Character area - position: right=0, top=150, size=160x198
          Positioned(
            right: 0,
            top: 150,
            child: _buildCharacterArea(),
          ),
          // Speech bubble with vertical bar - position: left=20, top=257
          Positioned(
            left: 20,
            top: 257,
            child: _buildSpeechBubble(),
          ),
          // Level chip - position: left=223, top=350
          Positioned(
            left: 223,
            top: 350,
            child: _buildLevelChip(),
          ),
        ],
      ),
    );
  }

  /// Logo widget - 64x24
  Widget _buildLogo() {
    return SizedBox(
      width: 64,
      height: 24,
      child: SvgPicture.asset(
        AppAssets.logo,
        width: 64,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  /// Welcome message with highlighted numbers
  /// Text spans with different styles matching Figma
  Widget _buildWelcomeMessage() {
    const lightGreen = Color(0xFFEAFF84);

    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 24,
          height: 1.6,
          letterSpacing: -0.48,
          color: AppColors.white,
        ),
        children: [
          TextSpan(
            text: '꾸물리안 님, \n',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '14번',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: lightGreen,
            ),
          ),
          TextSpan(
            text: '의 약속에서\n',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: '10번',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: lightGreen,
            ),
          ),
          TextSpan(
            text: ' 꾸물거렸어요!',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// Speech bubble with vertical green bar
  /// Bar: left=52 (relative 32px), width=11, height=140
  /// Bubble: left=0, top=10, width=186, height=50
  Widget _buildSpeechBubble() {
    return SizedBox(
      width: 186,
      height: 140,
      child: Stack(
        children: [
          // Vertical green bar (connector)
          Positioned(
            left: 32,
            top: 0,
            child: Container(
              width: 11,
              height: 140,
              decoration: const BoxDecoration(
                color: AppColors.green3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ),
          ),
          // Speech bubble
          Positioned(
            left: 0,
            top: 10,
            child: Container(
              width: 186,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.green3,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: const Text(
                '꾸물꿈에 오신 것을 환영해요!\n정시 도착으로 캐릭터를 성장시켜 보세요.',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  height: 1.6,
                  letterSpacing: -0.2,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Character area - 160x198, character image 156x134
  Widget _buildCharacterArea() {
    return SizedBox(
      width: 160,
      height: 198,
      child: Stack(
        children: [
          // Character image from Figma
          Positioned(
            right: 0,
            top: 14,
            child: Image.asset(
              AppAssets.characterLv1,
              width: 156,
              height: 134,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  /// Level chip - 114x28, rounded full
  Widget _buildLevelChip() {
    return Container(
      width: 114,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              height: 1.6,
              letterSpacing: -0.24,
            ),
            children: [
              TextSpan(
                text: 'Lv.1',
                style: TextStyle(color: AppColors.mainColor),
              ),
              TextSpan(
                text: '  빼꼼 꾸물이',
                style: TextStyle(color: AppColors.gray8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// White content section with rounded top corners
  Widget _buildWhiteContent() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // "가까운 약속은?" section - Figma: top=413 (relative: 16px from white section)
          _buildNearestAppointmentSection(),
          const SizedBox(height: 28), // Figma: gap between sections = 739 - (413+298) = 28px
          // "다가올 나의 약속은?" section - Figma: top=739
          _buildUpcomingAppointmentsSection(),
          // Bottom padding for navigation bar
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  /// "가까운 약속은?" section with home appointment card
  /// Figma: left=20, top=413 (relative to screen), gap=16
  Widget _buildNearestAppointmentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title with arrow - height 28
          // Figma: txt_title_ios, width=335, height=28
          SizedBox(
            height: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '가까운 약속은?',
                  style: AppTextStyles.body01.copyWith(
                    color: AppColors.gray8,
                  ),
                ),
                // ic_right: 24x24, positioned at left=311, top=2 (relative)
                // Figma: gray4 (#A5A5A5) color
                GestureDetector(
                  onTap: () {
                    // Navigate to appointment detail
                  },
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      AppAssets.icRight,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.gray4,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16), // gap: 16px
          // Home appointment card - 335x254
          // Figma: home_card_appnt_ios
          HomeAppointmentCard(
            groupName: '모임 이름',
            appointmentName: '기말고사 모각작',
            location: '용산역',
            time: 'PM 2:00',
            currentTime: '',
            progressValue: 0.17, // 58px / 334px
            readyState: ProgressState.start,
            moveState: ProgressState.disabled,
            arriveState: ProgressState.disabled,
            readyLabel: '준비 중',
            moveLabel: '이동 시작',
            arriveLabel: '도착 완료',
            helpMessage: '이동을 시작 시 눌러주세요',
            showChip: true,
          ),
        ],
      ),
    );
  }

  /// "다가올 나의 약속은?" section with horizontal scroll
  /// Figma: left=20 (center), top=739, width=335, gap=16
  Widget _buildUpcomingAppointmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title - height 28
        // Figma: txt_title_ios, width=335, height=28
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 28,
            child: Row(
              children: [
                Text(
                  '다가올 나의 약속은?',
                  style: AppTextStyles.body01.copyWith(
                    color: AppColors.gray8,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16), // gap: 16px
        // Horizontal scroll appointment cards
        // Figma: grp_card_appnt height=216 + extra for padding
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: const [
              // D-DAY card - Figma: grp_card_appnt, width=200
              AppointmentCard(
                dateType: AppointmentDateType.dDay,
                dDayText: 'D-DAY',
                groupName: '열기팟',
                appointmentName: '캔디팟 모각작',
                date: '2024.06.01',
                time: 'PM 6:00',
                location: '사당역 4번 출구',
                showChip: true,
              ),
              SizedBox(width: 12), // gap: 12px
              // D-3 card - Figma: grp_card_appnt, width=200
              AppointmentCard(
                dateType: AppointmentDateType.dMinus,
                dDayText: 'D-3',
                groupName: '캔디팟',
                appointmentName: '약속명',
                date: '2024.06.01',
                time: 'PM 2:00',
                location: '용산역',
                showChip: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

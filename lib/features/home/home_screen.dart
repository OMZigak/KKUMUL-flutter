import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';
import 'package:kkumul/shared/widgets/cards/home_appointment_card.dart';
import 'package:kkumul/shared/widgets/cards/appointment_card.dart';
import 'package:kkumul/shared/widgets/icons/app_icons.dart';

/// Home screen for the Kkumul app
///
/// Displays:
/// - Green header with logo, welcome message, character, and level chip
/// - Nearest appointment card with progress tracker
/// - Upcoming appointments horizontal scroll list
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top green section
              _buildTopSection(),
              // White content section
              _buildContentSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the top green section with logo, welcome message, character, and level chip
  Widget _buildTopSection() {
    return Container(
      color: AppColors.mainColor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                // Logo
                _buildLogo(),
                const SizedBox(height: 24),
                // Welcome message
                _buildWelcomeMessage(),
                const SizedBox(height: 16),
                // Speech bubble
                _buildSpeechBubble(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Character image (positioned on the right)
          Positioned(
            right: 0,
            top: 106,
            child: _buildCharacterArea(),
          ),
          // Level chip (positioned below character)
          Positioned(
            right: 38,
            top: 306,
            child: _buildLevelChip(),
          ),
        ],
      ),
    );
  }

  /// Builds the logo text
  Widget _buildLogo() {
    return const Text(
      '\uAFB8\uBB3C\uAFB8',
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.6,
        letterSpacing: -0.48,
        color: AppColors.white,
      ),
    );
  }

  /// Builds the welcome message with highlighted numbers
  Widget _buildWelcomeMessage() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 24,
          height: 1.6,
          letterSpacing: -0.48,
          color: AppColors.white,
        ),
        children: [
          const TextSpan(
            text: '\uAFB8\uBB3C\uB9AC\uC548 \uB2D8,\n',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '14\uBC88',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: const Color(0xFFEAFF84), // lightgreen
            ),
          ),
          const TextSpan(
            text: '\uC758 \uC57D\uC18D\uC5D0\uC11C\n',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: '10\uBC88',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: const Color(0xFFEAFF84), // lightgreen
            ),
          ),
          const TextSpan(
            text: ' \uAFB8\uBB3C\uAC70\uB838\uC5B4\uC694!',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// Builds the speech bubble with welcome tip
  Widget _buildSpeechBubble() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Speech bubble arrow/connector
        Container(
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
        // Speech bubble content
        Expanded(
          child: Stack(
            children: [
              // Bubble background
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: AppColors.green3.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Bubble text
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  '\uAFB8\uBB3C\uAFB8\uC5D0 \uC624\uC2E0 \uAC83\uC744 \uD658\uC601\uD574\uC694!\n\uC815\uC2DC \uB3C4\uCC29\uC73C\uB85C \uCE90\uB9AD\uD130\uB97C \uC131\uC7A5\uC2DC\uCF1C \uBCF4\uC138\uC694.',
                  style: AppTextStyles.label01.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the character placeholder area
  Widget _buildCharacterArea() {
    return Container(
      width: 160,
      height: 198,
      alignment: Alignment.center,
      child: Container(
        width: 156,
        height: 134,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            Icons.pets,
            size: 64,
            color: AppColors.white.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }

  /// Builds the level chip
  Widget _buildLevelChip() {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Lv.1',
            style: AppTextStyles.caption01.copyWith(
              color: AppColors.mainColor,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '\uBE7C\uAF5D \uAFB8\uBB3C\uC774',
            style: AppTextStyles.caption01.copyWith(
              color: AppColors.gray8,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the white content section with appointment cards
  Widget _buildContentSection() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nearest appointment section
            _buildNearestAppointmentSection(),
            const SizedBox(height: 32),
            // Upcoming appointments section
            _buildUpcomingAppointmentsSection(),
            const SizedBox(height: 100), // Bottom padding for navigation bar
          ],
        ),
      ),
    );
  }

  /// Builds the nearest appointment section
  Widget _buildNearestAppointmentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title with arrow
          _buildSectionTitle(
            title: '\uAC00\uAE4C\uC6B4 \uC57D\uC18D\uC740?',
            showArrow: true,
          ),
          const SizedBox(height: 16),
          // Home appointment card
          HomeAppointmentCard(
            groupName: '\uBAA8\uC784 \uC774\uB984',
            appointmentName: '\uAE30\uB9D0\uACE0\uC0AC \uBAA8\uAC01\uC791',
            location: '\uC6A9\uC0B0\uC5ED',
            time: 'PM 2:00',
            currentTime: '',
            progressValue: 0.17,
            readyState: ProgressState.start,
            moveState: ProgressState.disabled,
            arriveState: ProgressState.disabled,
            readyLabel: '\uC900\uBE44 \uC911',
            moveLabel: '\uC774\uB3D9 \uC2DC\uC791',
            arriveLabel: '\uB3C4\uCC29 \uC644\uB8CC',
            helpMessage: '\uC774\uB3D9\uC744 \uC2DC\uC791 \uC2DC \uB20C\uB7EC\uC8FC\uC138\uC694',
            showChip: true,
          ),
        ],
      ),
    );
  }

  /// Builds the upcoming appointments section
  Widget _buildUpcomingAppointmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildSectionTitle(
            title: '\uB2E4\uAC00\uC62C \uB098\uC758 \uC57D\uC18D\uC740?',
            showArrow: false,
          ),
        ),
        const SizedBox(height: 16),
        // Horizontal scroll list of appointment cards
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              // D-DAY appointment card
              AppointmentCard(
                dateType: AppointmentDateType.dDay,
                dDayText: 'D-DAY',
                groupName: '\uC5F4\uAE30\uD31F',
                appointmentName: '\uCE94\uB514\uD31F \uBAA8\uAC01\uC791',
                date: '2024.06.01',
                time: 'PM 6:00',
                location: '\uC0AC\uB2F9\uC5ED 4\uBC88 \uCD9C\uAD6C',
                showChip: true,
              ),
              const SizedBox(width: 12),
              // D-3 appointment card
              AppointmentCard(
                dateType: AppointmentDateType.dMinus,
                dDayText: 'D-3',
                groupName: '\uCE94\uB514\uD31F',
                appointmentName: '\uC57D\uC18D\uBA85',
                date: '2024.06.01',
                time: 'PM 2:00',
                location: '\uC6A9\uC0B0\uC5ED',
                showChip: true,
              ),
              const SizedBox(width: 12),
              // Additional card for scroll demonstration
              AppointmentCard(
                dateType: AppointmentDateType.dMinus,
                dDayText: 'D-7',
                groupName: '\uC2A4\uD130\uB514\uBAA8\uC784',
                appointmentName: '\uC8FC\uAC04 \uC2A4\uD130\uB514',
                date: '2024.06.08',
                time: 'PM 3:00',
                location: '\uAC15\uB0A8\uC5ED \uC2A4\uD0C0\uBC85\uC2A4',
                showChip: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a section title with optional right arrow
  Widget _buildSectionTitle({
    required String title,
    bool showArrow = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.body01.copyWith(
            color: AppColors.gray8,
          ),
        ),
        if (showArrow)
          GestureDetector(
            onTap: () {
              // Navigate to appointment detail
            },
            child: AppIcons.right(
              color: AppColors.gray8,
              size: 24,
            ),
          ),
      ],
    );
  }
}

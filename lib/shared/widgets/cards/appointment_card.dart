import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/constants/app_assets.dart';

/// Appointment date type for D-day display
enum AppointmentDateType {
  /// D-DAY - appointment is today (orange)
  dDay,

  /// D-N - days remaining before appointment (gray)
  dMinus,

  /// D+N - days passed after appointment (light gray/past)
  dPlus,
}

/// Group appointment card widget (grp_card_appnt)
///
/// Displays appointment information with D-day label, group chip,
/// appointment name, and date/time/location details.
///
/// Size: width 200, borderRadius 8, border #DFDFDF
class AppointmentCard extends StatelessWidget {
  /// The type of D-day display
  final AppointmentDateType dateType;

  /// The D-day text to display (e.g., "D-DAY", "D-3", "D+2")
  final String? dDayText;

  /// The group name displayed in the chip
  final String groupName;

  /// The appointment name/title
  final String appointmentName;

  /// The date of the appointment (e.g., "2024.06.01")
  final String date;

  /// The time of the appointment (e.g., "PM 2:00")
  final String time;

  /// The location of the appointment
  final String location;

  /// Whether to show the group chip
  final bool showChip;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  const AppointmentCard({
    super.key,
    this.dateType = AppointmentDateType.dDay,
    this.dDayText,
    this.groupName = '',
    this.appointmentName = '',
    this.date = '',
    this.time = '',
    this.location = '',
    this.showChip = true,
    this.onTap,
  });

  /// Returns the appropriate color for the D-day label based on type
  Color get _dDayColor {
    switch (dateType) {
      case AppointmentDateType.dDay:
        return const Color(0xFFFF7B30); // orange
      case AppointmentDateType.dMinus:
        return const Color(0xFF8B8B8B); // gray5
      case AppointmentDateType.dPlus:
        return const Color(0xFFC1C1C1); // gray3
    }
  }

  /// Returns the display text for D-day
  String get _dDayDisplayText {
    if (dDayText != null && dDayText!.isNotEmpty) {
      return dDayText!;
    }
    switch (dateType) {
      case AppointmentDateType.dDay:
        return 'D-DAY';
      case AppointmentDateType.dMinus:
        return 'D-0';
      case AppointmentDateType.dPlus:
        return 'D+0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            // D-day label
            _buildDDayLabel(),
            const SizedBox(height: 8),
            // Chip and appointment name
            _buildAppointmentInfo(),
            const SizedBox(height: 8),
            // Date, time, location info
            _buildDetailInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildDDayLabel() {
    return Text(
      _dDayDisplayText,
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.6,
        letterSpacing: -0.28,
        color: _dDayColor,
      ),
    );
  }

  Widget _buildAppointmentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showChip && groupName.isNotEmpty) ...[
          _buildGroupChip(),
          const SizedBox(height: 4),
        ],
        Text(
          appointmentName,
          style: const TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.6,
            letterSpacing: -0.32,
            color: Color(0xFF242424), // gray8
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildGroupChip() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFD4F7E8), // green2
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          groupName,
          style: const TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1.6,
            letterSpacing: -0.24,
            color: Color(0xFF00A775), // green3
          ),
        ),
      ),
    );
  }

  /// Detail info section with date, time, location
  /// Figma: gap=8 between rows
  Widget _buildDetailInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date row - Figma: ic_date_fill + text, gap=8
        _buildInfoRow(
          iconPath: AppAssets.icDate,
          text: date,
          iconColor: const Color(0xFF3D3D3D), // gray7
          textColor: const Color(0xFF3D3D3D), // gray7
        ),
        const SizedBox(height: 8), // gap: 8px
        // Time row - Figma: ic_time_fill + text, gap=8
        _buildInfoRow(
          iconPath: AppAssets.icTime,
          text: time,
          iconColor: const Color(0xFF242424), // gray8
          textColor: const Color(0xFF242424), // gray8
        ),
        const SizedBox(height: 8), // gap: 8px
        // Location row - Figma: ic_pin_fill + text, gap=8
        _buildInfoRow(
          iconPath: AppAssets.icPin,
          text: location,
          iconColor: const Color(0xFF242424), // gray8
          textColor: const Color(0xFF242424), // gray8
        ),
      ],
    );
  }

  /// Info row with SVG icon and text
  /// Figma: icon 24x24, gap=8 between icon and text
  Widget _buildInfoRow({
    required String iconPath,
    required String text,
    required Color iconColor,
    required Color textColor,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 8), // gap: 8px
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.6,
              letterSpacing: -0.28,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

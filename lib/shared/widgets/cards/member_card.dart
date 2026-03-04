import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';

/// Member status for the chip display
enum MemberStatus {
  /// Before state - not started
  before,

  /// Ready/Preparing state
  ready,

  /// Moving state
  move,

  /// Arrived state
  arrive,
}

/// Group member card widget (grp_card_memb)
///
/// Displays member information in a group with profile image,
/// name, and optional status chip.
///
/// Size: width 335, height 72, borderRadius 8
class MemberCard extends StatelessWidget {
  /// The member's profile image URL
  final String? profileImageUrl;

  /// The member's name
  final String name;

  /// The member's current status
  final MemberStatus status;

  /// Whether to show the status chip
  final bool showStatusChip;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  const MemberCard({
    super.key,
    this.profileImageUrl,
    this.name = '',
    this.status = MemberStatus.before,
    this.showStatusChip = true,
    this.onTap,
  });

  /// Returns the status chip label based on status
  String get _statusLabel {
    switch (status) {
      case MemberStatus.before:
        return '꾸물중';
      case MemberStatus.ready:
        return '꾸물중';
      case MemberStatus.move:
        return '이동중';
      case MemberStatus.arrive:
        return '도착';
    }
  }

  /// Returns the status chip background color
  Color get _statusBackgroundColor {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return AppColors.white;
      case MemberStatus.move:
      case MemberStatus.arrive:
        return const Color(0xFFD4F7E8); // green2
    }
  }

  /// Returns the status chip text color
  Color get _statusTextColor {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return const Color(0xFFC1C1C1); // gray3
      case MemberStatus.move:
      case MemberStatus.arrive:
        return AppColors.mainColor;
    }
  }

  /// Returns the status chip border color
  Color get _statusBorderColor {
    switch (status) {
      case MemberStatus.before:
      case MemberStatus.ready:
        return const Color(0xFFC1C1C1); // gray3
      case MemberStatus.move:
      case MemberStatus.arrive:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335,
        height: 72,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              // Profile image and name
              Expanded(
                child: Row(
                  children: [
                    _buildProfileImage(),
                    const SizedBox(width: 12),
                    _buildName(),
                  ],
                ),
              ),
              // Status chip
              if (showStatusChip) _buildStatusChip(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray2,
      ),
      child: ClipOval(
        child: profileImageUrl != null && profileImageUrl!.isNotEmpty
            ? Image.network(
                profileImageUrl!,
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

  Widget _buildName() {
    return Text(
      name,
      style: const TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.6,
        letterSpacing: -0.32,
        color: Color(0xFF000000), // black0
      ),
    );
  }

  Widget _buildStatusChip() {
    return Container(
      width: 68,
      height: 28,
      decoration: BoxDecoration(
        color: _statusBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _statusBorderColor,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          _statusLabel,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.6,
            letterSpacing: -0.28,
            color: _statusTextColor,
          ),
        ),
      ),
    );
  }
}

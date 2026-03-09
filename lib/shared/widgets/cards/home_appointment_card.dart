import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/icons/app_icons.dart';

/// Progress state for the home appointment card
enum ProgressState {
  /// Disabled state - not started yet
  disabled,

  /// Ready to start
  start,

  /// Currently in progress
  inProgress,

  /// Arrived/completed
  arrive,
}

/// Member avatar data for the home appointment card
class MemberAvatar {
  final String? imageUrl;
  final String? name;

  const MemberAvatar({
    this.imageUrl,
    this.name,
  });
}

/// Home screen appointment card widget (home_card_appnt)
///
/// Displays appointment information with group chip, name,
/// location/time info, progress bar and member avatars.
///
/// Size: width 335, height ~254, borderRadius 8
class HomeAppointmentCard extends StatelessWidget {
  /// The group name displayed in the chip
  final String groupName;

  /// The appointment name/title
  final String appointmentName;

  /// The location of the appointment
  final String location;

  /// The time of the appointment (e.g., "PM 2:00")
  final String time;

  /// Current preparation time display (e.g., "AM 11:00")
  final String currentTime;

  /// Current progress value (0.0 to 1.0)
  final double progressValue;

  /// States for each progress step
  final ProgressState readyState;
  final ProgressState moveState;
  final ProgressState arriveState;

  /// Labels for progress buttons
  final String readyLabel;
  final String moveLabel;
  final String arriveLabel;

  /// Help message displayed below the active button
  final String? helpMessage;

  /// List of member avatars to display
  final List<MemberAvatar> members;

  /// Whether to show the group chip
  final bool showChip;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Callbacks for progress buttons
  final VoidCallback? onReadyTap;
  final VoidCallback? onMoveTap;
  final VoidCallback? onArriveTap;

  const HomeAppointmentCard({
    super.key,
    this.groupName = '',
    this.appointmentName = '',
    this.location = '',
    this.time = '',
    this.currentTime = '',
    this.progressValue = 0.0,
    this.readyState = ProgressState.disabled,
    this.moveState = ProgressState.disabled,
    this.arriveState = ProgressState.disabled,
    this.readyLabel = '',
    this.moveLabel = '',
    this.arriveLabel = '',
    this.helpMessage,
    this.members = const [],
    this.showChip = true,
    this.onTap,
    this.onReadyTap,
    this.onMoveTap,
    this.onArriveTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335,
        height: 254, // Fixed height per Figma
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.gray2,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top section: Chip, name, location/time (112px)
            _buildTopSection(),
            const SizedBox(height: 12), // Gap per Figma
            // Bottom section: Progress bar and buttons (103px)
            _buildProgressSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      height: 112, // Fixed height per Figma
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Chip and appointment name
                  Column(
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
                          color: Color(0xFF242424),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Location and time row
                  _buildLocationTimeRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupChip() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFD4F7E8),
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
            color: Color(0xFF00A775),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationTimeRow() {
    return Row(
      children: [
        // Location
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcons.pinFill(color: const Color(0xFF242424), size: 24),
            const SizedBox(width: 4),
            Text(
              location,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.6,
                letterSpacing: -0.28,
                color: Color(0xFF242424),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        // Time
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcons.timeFill(color: const Color(0xFF242424), size: 24),
            const SizedBox(width: 4),
            Text(
              time,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.6,
                letterSpacing: -0.28,
                color: Color(0xFF242424),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return SizedBox(
      height: 103,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Progress bar - positioned at vertical center minus offset
          Positioned(
            left: 0,
            right: 4,
            top: 31.5,
            child: _buildProgressBar(),
          ),
          // Progress buttons row
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ready button (준비 중)
                SizedBox(
                  width: 110,
                  child: _buildProgressButton(
                    state: readyState,
                    label: readyLabel,
                    showTime: readyState == ProgressState.inProgress,
                    timeText: currentTime,
                    showHelpMessage:
                        readyState == ProgressState.start && helpMessage != null,
                    helpText: helpMessage,
                    onTap: onReadyTap,
                  ),
                ),
                // Move button (이동 시작)
                SizedBox(
                  width: 110,
                  child: _buildProgressButton(
                    state: moveState,
                    label: moveLabel,
                    onTap: onMoveTap,
                  ),
                ),
                // Arrive button (도착 완료)
                SizedBox(
                  width: 110,
                  child: _buildProgressButton(
                    state: arriveState,
                    label: arriveLabel,
                    onTap: onArriveTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 5,
      width: 334,
      decoration: const BoxDecoration(
        color: AppColors.gray2,
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progressValue.clamp(0.0, 1.0),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressButton({
    required ProgressState state,
    required String label,
    bool showTime = false,
    String? timeText,
    bool showHelpMessage = false,
    String? helpText,
    VoidCallback? onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Spacer for top alignment
        const SizedBox(height: 8),
        // Progress point
        _buildProgressPoint(state),
        const SizedBox(height: 8),
        // Button
        GestureDetector(
          onTap: state != ProgressState.disabled ? onTap : null,
          child: Container(
            width: 84,
            height: 32,
            decoration: BoxDecoration(
              color: _getButtonBackgroundColor(state),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _getButtonBorderColor(state),
                width: 1,
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
                  color: _getButtonTextColor(state),
                ),
              ),
            ),
          ),
        ),
        // Help message
        if (showHelpMessage && helpText != null) ...[
          const SizedBox(height: 2),
          SizedBox(
            height: 16,
            child: Text(
              helpText,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                height: 1.6,
                letterSpacing: -0.2,
                color: Color(0xFF8B8B8B),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ] else ...[
          const SizedBox(height: 18),
        ],
      ],
    );
  }

  Widget _buildProgressPoint(ProgressState state) {
    final bool isActive =
        state == ProgressState.inProgress || state == ProgressState.arrive;
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.mainColor : AppColors.gray2,
        border: Border.all(
          color: isActive ? AppColors.mainColor : AppColors.gray2,
          width: 2,
        ),
      ),
      child: isActive
          ? const Center(
              child: Icon(
                Icons.check,
                size: 10,
                color: AppColors.white,
              ),
            )
          : null,
    );
  }

  Color _getButtonBackgroundColor(ProgressState state) {
    switch (state) {
      case ProgressState.disabled:
        return AppColors.white;
      case ProgressState.start:
        return AppColors.white;
      case ProgressState.inProgress:
        return const Color(0xFFD4F7E8);
      case ProgressState.arrive:
        return AppColors.mainColor;
    }
  }

  Color _getButtonBorderColor(ProgressState state) {
    switch (state) {
      case ProgressState.disabled:
        return const Color(0xFFC1C1C1);
      case ProgressState.start:
      case ProgressState.inProgress:
      case ProgressState.arrive:
        return AppColors.mainColor;
    }
  }

  Color _getButtonTextColor(ProgressState state) {
    switch (state) {
      case ProgressState.disabled:
        return const Color(0xFFC1C1C1);
      case ProgressState.start:
      case ProgressState.inProgress:
        return AppColors.mainColor;
      case ProgressState.arrive:
        return AppColors.white;
    }
  }
}

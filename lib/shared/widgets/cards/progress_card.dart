import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';

/// Progress state for the progress card buttons
enum ProgressButtonState {
  /// Disabled state - not clickable
  disabled,

  /// Start state - ready to be clicked
  start,

  /// In progress state - currently active
  inProgress,

  /// Arrived/completed state
  arrive,
}

/// Preparation progress card widget (prog_card_state)
///
/// Shows preparation progress state with time info,
/// progress bar, and three stage buttons.
///
/// Size: width 335, height ~180
class ProgressCard extends StatelessWidget {
  /// Current time display (e.g., "AM 11:00")
  final String currentTime;

  /// Progress value (0.0 to 1.0)
  final double progressValue;

  /// States for each progress step
  final ProgressButtonState readyState;
  final ProgressButtonState moveState;
  final ProgressButtonState arriveState;

  /// Labels for progress buttons
  final String readyLabel;
  final String moveLabel;
  final String arriveLabel;

  /// Help message displayed below the active button
  final String? helpMessage;

  /// Whether to show the popup message at bottom
  final bool showPopupMessage;

  /// The popup message text
  final String popupMessage;

  /// Callbacks for progress buttons
  final VoidCallback? onReadyTap;
  final VoidCallback? onMoveTap;
  final VoidCallback? onArriveTap;

  const ProgressCard({
    super.key,
    this.currentTime = '',
    this.progressValue = 0.0,
    this.readyState = ProgressButtonState.disabled,
    this.moveState = ProgressButtonState.disabled,
    this.arriveState = ProgressButtonState.disabled,
    this.readyLabel = '',
    this.moveLabel = '',
    this.arriveLabel = '',
    this.helpMessage,
    this.showPopupMessage = true,
    this.popupMessage = '',
    this.onReadyTap,
    this.onMoveTap,
    this.onArriveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Main progress card
        _buildProgressCard(),
        if (showPopupMessage) ...[
          const SizedBox(height: 4),
          _buildPopupMessage(),
        ],
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      width: 335,
      height: 136,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.gray2,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Progress bar
          Positioned(
            left: -0.5,
            right: 0,
            top: 49.5,
            child: _buildProgressBar(),
          ),
          // Progress buttons row
          Positioned(
            left: -1,
            right: 0,
            top: 18,
            child: _buildProgressButtonsRow(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 5,
      margin: const EdgeInsets.symmetric(horizontal: 0.5),
      decoration: const BoxDecoration(
        color: Color(0xFFDFDFDF), // gray2
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progressValue.clamp(0.0, 1.0),
        child: Container(
          color: AppColors.mainColor,
        ),
      ),
    );
  }

  Widget _buildProgressButtonsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildProgressButton(
            state: readyState,
            label: readyLabel,
            showTime: readyState == ProgressButtonState.inProgress,
            timeText: currentTime,
            onTap: onReadyTap,
          ),
        ),
        Expanded(
          child: _buildProgressButton(
            state: moveState,
            label: moveLabel,
            showHelpMessage:
                moveState == ProgressButtonState.start && helpMessage != null,
            helpText: helpMessage,
            onTap: onMoveTap,
          ),
        ),
        Expanded(
          child: _buildProgressButton(
            state: arriveState,
            label: arriveLabel,
            onTap: onArriveTap,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressButton({
    required ProgressButtonState state,
    required String label,
    bool showTime = false,
    String? timeText,
    bool showHelpMessage = false,
    String? helpText,
    VoidCallback? onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Time text (if showing)
        if (showTime && timeText != null) ...[
          Text(
            timeText,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.6,
              letterSpacing: -0.24,
              color: Color(0xFF242424),
            ),
          ),
          const SizedBox(height: 8),
        ] else ...[
          const SizedBox(height: 27),
        ],
        // Progress point
        _buildProgressPoint(state),
        const SizedBox(height: 8),
        // Button
        GestureDetector(
          onTap: state != ProgressButtonState.disabled ? onTap : null,
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
          const SizedBox(height: 4),
          Text(
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
          ),
        ] else ...[
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _buildProgressPoint(ProgressButtonState state) {
    final bool isActive = state == ProgressButtonState.inProgress ||
        state == ProgressButtonState.arrive;
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

  Color _getButtonBackgroundColor(ProgressButtonState state) {
    switch (state) {
      case ProgressButtonState.disabled:
        return AppColors.white;
      case ProgressButtonState.start:
        return AppColors.white;
      case ProgressButtonState.inProgress:
        return const Color(0xFFD4F7E8); // green2
      case ProgressButtonState.arrive:
        return AppColors.mainColor;
    }
  }

  Color _getButtonBorderColor(ProgressButtonState state) {
    switch (state) {
      case ProgressButtonState.disabled:
        return const Color(0xFFC1C1C1); // gray3
      case ProgressButtonState.start:
      case ProgressButtonState.inProgress:
      case ProgressButtonState.arrive:
        return AppColors.mainColor;
    }
  }

  Color _getButtonTextColor(ProgressButtonState state) {
    switch (state) {
      case ProgressButtonState.disabled:
        return const Color(0xFFC1C1C1); // gray3
      case ProgressButtonState.start:
      case ProgressButtonState.inProgress:
        return AppColors.mainColor;
      case ProgressButtonState.arrive:
        return AppColors.white;
    }
  }

  Widget _buildPopupMessage() {
    return SizedBox(
      width: 335,
      height: 40,
      child: Stack(
        children: [
          // Speech bubble background
          Positioned.fill(
            child: CustomPaint(
              painter: _SpeechBubblePainter(),
            ),
          ),
          // Message text
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                popupMessage,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 1.6,
                  letterSpacing: -0.24,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for the speech bubble shape
class _SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.mainColor
      ..style = PaintingStyle.fill;

    final path = Path();
    const double cornerRadius = 8;
    const double arrowWidth = 12;
    const double arrowHeight = 6;

    // Start from top-left, draw arrow pointing up at center
    path.moveTo(cornerRadius, arrowHeight);
    path.lineTo((size.width - arrowWidth) / 2, arrowHeight);
    path.lineTo(size.width / 2, 0);
    path.lineTo((size.width + arrowWidth) / 2, arrowHeight);
    path.lineTo(size.width - cornerRadius, arrowHeight);

    // Top-right corner
    path.quadraticBezierTo(
        size.width, arrowHeight, size.width, arrowHeight + cornerRadius);

    // Right edge
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom-right corner
    path.quadraticBezierTo(
        size.width, size.height, size.width - cornerRadius, size.height);

    // Bottom edge
    path.lineTo(cornerRadius, size.height);

    // Bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left edge
    path.lineTo(0, arrowHeight + cornerRadius);

    // Top-left corner
    path.quadraticBezierTo(0, arrowHeight, cornerRadius, arrowHeight);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

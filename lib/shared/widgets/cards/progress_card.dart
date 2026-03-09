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
    // Figma: progress_card_appnt (node I1:15633;1:14230)
    // height: 136, borderRadius: 8, shadow: drop shadow
    return Container(
      width: 335,
      height: 136,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000), // rgba(0,0,0,0.02)
            offset: Offset(3, 3),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Color(0x05000000), // rgba(0,0,0,0.02)
            offset: Offset(-3, -3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Progress bar - Figma: readyinfo_progrbar_ios at top: 50.5px
          Positioned(
            left: 0.5,
            right: 0.5,
            top: 50.5,
            child: _buildProgressBar(),
          ),
          // Progress buttons row - Figma: top: 19px
          Positioned(
            left: 0,
            right: 4,
            top: 19,
            child: _buildProgressButtonsRow(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    // Figma: readyinfo_progrbar_ios (node I1:15633;1:14231)
    // height: 5, width: 334, bg: #DFDFDF, fill: #0FD380
    return Container(
      height: 5,
      decoration: const BoxDecoration(
        color: Color(0xFFDFDFDF), // gray2
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progressValue.clamp(0.0, 1.0),
        child: Container(
          color: AppColors.mainColor, // #0FD380
        ),
      ),
    );
  }

  Widget _buildProgressButtonsRow() {
    // Figma: btn_state components - each w:110, h:82 with -4px margin
    return Row(
      children: [
        // Ready button - Figma node I1:15633;1:14233
        SizedBox(
          width: 110,
          child: _buildProgressButton(
            state: readyState,
            label: readyLabel,
            showTime: readyState == ProgressButtonState.inProgress,
            timeText: currentTime,
            onTap: onReadyTap,
          ),
        ),
        // Move button - Figma node I1:15633;1:14234
        SizedBox(
          width: 110,
          child: _buildProgressButton(
            state: moveState,
            label: moveLabel,
            showHelpMessage:
                moveState == ProgressButtonState.start && helpMessage != null,
            helpText: helpMessage ?? '이동을 시작 시 눌러주세요',
            onTap: onMoveTap,
          ),
        ),
        // Arrive button - disabled state
        SizedBox(
          width: 110,
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
    // Figma: btn_state component - w:110, h:82
    // Layout: gap 8px between elements, justify-end
    return SizedBox(
      height: 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Time text (if showing) - Figma: caption 02 style
          if (showTime && timeText != null) ...[
            Text(
              timeText,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.6,
                letterSpacing: -0.24,
                color: Color(0xFF242424), // gray8
              ),
            ),
          ],
          const SizedBox(height: 8),
          // Progress point - Figma: ready_point (16x16)
          _buildProgressPoint(state),
          const SizedBox(height: 8),
          // Button - Figma: main_btn_kkumul_ios / btn_small (w:84, h:32, borderRadius:20)
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
          // Help message - Figma: label 02 style, color: #8B8B8B (gray5)
          if (showHelpMessage && helpText != null) ...[
            const SizedBox(height: 4),
            SizedBox(
              width: 112,
              child: Text(
                helpText,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 1.6,
                  letterSpacing: -0.2,
                  color: Color(0xFF8B8B8B), // gray5
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressPoint(ProgressButtonState state) {
    // Figma: ready_point (16x16)
    // active state (inProgress/arrive): filled green (#0FD380)
    // inactive state (disabled/start): gray ring (#DFDFDF)
    final bool isActive = state == ProgressButtonState.inProgress ||
        state == ProgressButtonState.arrive;

    if (isActive) {
      // Figma: imgReadyPoint1 - filled green circle
      return Container(
        width: 16,
        height: 16,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF0FD380), // mainColor
        ),
      );
    } else {
      // Figma: imgReadyPoint - gray ring (stroke only)
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: const Color(0xFFDFDFDF), // gray2
            width: 2,
          ),
        ),
      );
    }
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
    // Figma: text_popup (node I1:15633;1:14236)
    // Union shape with arrow pointing up, height: 40, width: 335
    // text: caption 01 style, color: #ECFCF5 (green1)
    return SizedBox(
      width: 335,
      height: 40,
      child: Stack(
        children: [
          // Speech bubble background - Figma: Union shape
          Positioned.fill(
            child: CustomPaint(
              painter: _SpeechBubblePainter(),
            ),
          ),
          // Message text - Figma: centered, top offset for arrow
          Positioned(
            left: 0,
            right: 0,
            top: 14, // offset for arrow + centering
            child: Text(
              popupMessage,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.6,
                letterSpacing: -0.24,
                color: Color(0xFFECFCF5), // green1
              ),
              textAlign: TextAlign.center,
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

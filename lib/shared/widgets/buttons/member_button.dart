import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// Member button state
enum MemberButtonState {
  /// Default state: white background, grey border
  defaultState,

  /// Enabled/selected state: light green background, green border
  enabled,

  /// Small version without border (bgx)
  bgx,
}

/// Member selection button component (btn_memb)
///
/// States:
/// - default: white bg, border #DFDFDF, size 104x128
/// - enabled: #ECFCF5 bg, border #0FD380, size 104x128
/// - bgx: no border, size 68x88
class MemberButton extends StatelessWidget {
  const MemberButton({
    super.key,
    required this.name,
    this.profileImageUrl,
    this.state = MemberButtonState.defaultState,
    this.onPressed,
  });

  /// Member name
  final String name;

  /// Profile image URL (optional)
  final String? profileImageUrl;

  /// Button state
  final MemberButtonState state;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: _border,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileImage(),
            SizedBox(height: _isBgx ? 6 : 10),
            Text(
              name,
              style: AppTextStyles.buttonMember.copyWith(
                color: AppColors.black,
                fontSize: _isBgx ? 12 : 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  bool get _isBgx => state == MemberButtonState.bgx;

  double get _width => _isBgx ? 68 : 104;

  double get _height => _isBgx ? 88 : 128;

  double get _profileSize => _isBgx ? 44 : 64;

  Color get _backgroundColor {
    switch (state) {
      case MemberButtonState.defaultState:
        return AppColors.white;
      case MemberButtonState.enabled:
        return AppColors.primaryLight;
      case MemberButtonState.bgx:
        return Colors.transparent;
    }
  }

  Border? get _border {
    switch (state) {
      case MemberButtonState.defaultState:
        return Border.all(color: AppColors.border, width: 1);
      case MemberButtonState.enabled:
        return Border.all(color: AppColors.primary, width: 2);
      case MemberButtonState.bgx:
        return null;
    }
  }

  Widget _buildProfileImage() {
    return Container(
      width: _profileSize,
      height: _profileSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.greyLight,
        border: Border.all(
          color: state == MemberButtonState.enabled
              ? AppColors.primary
              : AppColors.border,
          width: 1,
        ),
      ),
      child: profileImageUrl != null
          ? ClipOval(
              child: Image.network(
                profileImageUrl!,
                width: _profileSize,
                height: _profileSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderIcon();
                },
              ),
            )
          : _buildPlaceholderIcon(),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Icon(
      Icons.person,
      size: _profileSize * 0.5,
      color: AppColors.grey,
    );
  }
}

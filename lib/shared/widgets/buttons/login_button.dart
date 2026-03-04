import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';
import 'package:kkumul/shared/widgets/theme/app_text_styles.dart';

/// Login button type
enum LoginButtonType {
  kakao,
  apple,
}

/// Social login button component
///
/// Types:
/// - kakao: Yellow background (#FCE64A), dark text, kakao logo
/// - apple: White background with border, dark text, apple logo
class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.type,
    this.onPressed,
    this.width = 335,
    this.height = 54,
  });

  /// Login button type (kakao or apple)
  final LoginButtonType type;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button width
  final double width;

  /// Button height
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: _border,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(width: 8),
                Text(
                  _buttonText,
                  style: AppTextStyles.buttonLogin.copyWith(
                    color: _textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (type) {
      case LoginButtonType.kakao:
        return AppColors.kakaoBackground;
      case LoginButtonType.apple:
        return AppColors.appleBackground;
    }
  }

  Color get _textColor {
    switch (type) {
      case LoginButtonType.kakao:
        return AppColors.kakaoText;
      case LoginButtonType.apple:
        return AppColors.appleText;
    }
  }

  Border? get _border {
    switch (type) {
      case LoginButtonType.kakao:
        return null;
      case LoginButtonType.apple:
        return Border.all(color: AppColors.appleBorder, width: 1);
    }
  }

  String get _buttonText {
    switch (type) {
      case LoginButtonType.kakao:
        return '카카오로 로그인';
      case LoginButtonType.apple:
        return 'Apple로 로그인';
    }
  }

  Widget _buildLogo() {
    switch (type) {
      case LoginButtonType.kakao:
        return _KakaoLogo();
      case LoginButtonType.apple:
        return _AppleLogo();
    }
  }
}

class _KakaoLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Kakao logo icon placeholder
    // Replace with actual asset: Image.asset('assets/icons/kakao_logo.png')
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: AppColors.kakaoText,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Icon(
        Icons.chat_bubble,
        size: 14,
        color: AppColors.kakaoBackground,
      ),
    );
  }
}

class _AppleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Apple logo icon placeholder
    // Replace with actual asset: Image.asset('assets/icons/apple_logo.png')
    return const Icon(
      Icons.apple,
      size: 20,
      color: AppColors.appleText,
    );
  }
}

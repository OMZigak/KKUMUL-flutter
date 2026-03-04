import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';
import 'package:kkumul/shared/widgets/navigation/navigation.dart';
import 'package:kkumul/shared/widgets/text_fields/text_fields.dart';
import 'package:kkumul/shared/widgets/buttons/buttons.dart';

/// InviteCodeScreen - Screen for entering an invite code to join a group
class InviteCodeScreen extends StatefulWidget {
  const InviteCodeScreen({super.key});

  @override
  State<InviteCodeScreen> createState() => _InviteCodeScreenState();
}

class _InviteCodeScreenState extends State<InviteCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorText;
  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _isButtonEnabled =>
      _codeController.text.isNotEmpty && !_isLoading;

  void _onCodeChanged(String value) {
    setState(() {
      // Clear error when user starts typing
      if (_errorText != null) {
        _errorText = null;
      }
    });
  }

  Future<void> _onConfirm() async {
    final code = _codeController.text.trim();

    if (code.isEmpty) {
      setState(() {
        _errorText = '초대 코드를 입력해 주세요.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      // TODO: Implement actual API call to validate invite code
      // For now, simulate API call
      await Future.delayed(const Duration(milliseconds: 500));

      // Simulate validation - in real app, this would be an API response
      final isValidCode = _validateInviteCode(code);

      if (!mounted) return;

      if (isValidCode) {
        // Success - navigate to groups list
        context.go('/groups');
      } else {
        setState(() {
          _errorText = '유효하지 않은 초대 코드입니다.';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorText = '오류가 발생했습니다. 다시 시도해 주세요.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Temporary validation logic - replace with actual API call
  bool _validateInviteCode(String code) {
    // In real implementation, this would validate against backend
    return code.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar
          AppTopBar(
            onBackPressed: () => context.pop(),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  // Title
                  Text(
                    '모임 초대 코드를\n입력해 주세요',
                    style: AppTextStyles.headline2.copyWith(
                      fontSize: 22,
                      letterSpacing: -0.44,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Invite code text field
                  AppTextField(
                    controller: _codeController,
                    focusNode: _focusNode,
                    hintText: '초대 코드 입력',
                    errorText: _errorText,
                    onChanged: _onCodeChanged,
                    onSubmitted: (_) => _onConfirm(),
                    textInputAction: TextInputAction.done,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),

          // Bottom button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                text: '확인',
                isEnabled: _isButtonEnabled,
                onPressed: _onConfirm,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

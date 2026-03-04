import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';
import 'package:kkumul/shared/widgets/navigation/navigation.dart';
import 'package:kkumul/shared/widgets/text_fields/text_fields.dart';
import 'package:kkumul/shared/widgets/buttons/buttons.dart';
import 'package:kkumul/shared/widgets/dialogs/dialogs.dart';

/// CreateGroupScreen - Screen for creating a new group
class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;

  static const int maxNameLength = 10;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
  }

  @override
  void dispose() {
    _nameController.removeListener(_onNameChanged);
    _nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    setState(() {});
  }

  bool get _isButtonEnabled =>
      _nameController.text.trim().isNotEmpty && !_isLoading;

  Future<void> _onConfirm() async {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement actual API call to create group
      // For now, simulate API call
      await Future.delayed(const Duration(milliseconds: 500));

      // Generate invite code (in real app, this would come from API response)
      final inviteCode = _generateInviteCode();

      if (!mounted) return;

      // Show invite dialog
      await _showInviteDialog(inviteCode);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('모임 생성에 실패했습니다. 다시 시도해 주세요.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Generate a random invite code (temporary - should come from backend)
  String _generateInviteCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    String code = '';
    for (int i = 0; i < 6; i++) {
      code += chars[(random + i * 7) % chars.length];
    }
    return code;
  }

  Future<void> _showInviteDialog(String inviteCode) async {
    await InviteDialog.show(
      context,
      inviteCode: inviteCode,
      onLaterPressed: () {
        Navigator.of(context).pop(); // Close dialog
        context.go('/groups'); // Navigate to groups list
      },
      onCopyPressed: () {
        // Copy invite code to clipboard
        Clipboard.setData(ClipboardData(text: inviteCode));
        Navigator.of(context).pop(); // Close dialog

        // Show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('초대 코드가 복사되었습니다.'),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate to groups list
        context.go('/groups');
      },
    );
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
                    '모임 이름을\n입력해 주세요',
                    style: AppTextStyles.headline2.copyWith(
                      fontSize: 22,
                      letterSpacing: -0.44,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Group name text field
                  AppTextField(
                    controller: _nameController,
                    focusNode: _focusNode,
                    hintText: '모임 이름 입력',
                    maxLength: maxNameLength,
                    showCounter: true,
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

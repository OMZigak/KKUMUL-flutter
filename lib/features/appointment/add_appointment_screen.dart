import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/shared/widgets/navigation/navigation.dart';
import 'package:kkumul/shared/widgets/text_fields/text_fields.dart';
import 'package:kkumul/shared/widgets/buttons/buttons.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// 약속 추가하기 화면
///
/// 새로운 약속을 생성하는 폼 화면입니다.
/// - 약속 이름 입력
/// - 날짜 선택
/// - 시간 선택
/// - 장소 입력
/// - 벌칙 입력 (선택사항)
class AddAppointmentScreen extends StatefulWidget {
  /// 그룹 ID (선택사항, 쿼리 파라미터로 전달)
  final String? groupId;

  const AddAppointmentScreen({
    super.key,
    this.groupId,
  });

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _penaltyController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  bool get _isFormValid {
    return _nameController.text.isNotEmpty &&
        _selectedDate != null &&
        _selectedTime != null &&
        _locationController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _penaltyController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_isFormValid) return;

    // TODO: API 연동 - 약속 생성 요청
    // final appointment = {
    //   'name': _nameController.text,
    //   'date': _selectedDate,
    //   'time': _selectedTime,
    //   'location': _locationController.text,
    //   'penalty': _penaltyController.text,
    //   'groupId': widget.groupId,
    // };

    // 성공 시 이전 화면으로 이동
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // TopBar
            AppTopBar(
              title: '약속 추가하기',
              showBackButton: true,
              onBackPressed: () => context.pop(),
            ),

            // Form content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    // 약속 이름
                    AppTextField(
                      label: '약속 이름',
                      hintText: '약속 이름을 입력해주세요',
                      controller: _nameController,
                      maxLength: 20,
                      showCounter: true,
                      width: double.infinity,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 24),

                    // 날짜 & 시간 선택
                    Text(
                      '날짜 및 시간',
                      style: AppTextStyles.textFieldLabel.copyWith(
                        color: AppColors.textFieldText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: DateField(
                            hintText: '날짜 선택',
                            selectedDate: _selectedDate,
                            firstDate: DateTime.now(),
                            width: double.infinity,
                            onDateSelected: (date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TimeField(
                            hintText: '시간 선택',
                            selectedTime: _selectedTime,
                            width: double.infinity,
                            onTimeSelected: (time) {
                              setState(() {
                                _selectedTime = time;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // 장소 입력
                    AppTextField(
                      label: '장소',
                      hintText: '장소를 입력해주세요',
                      controller: _locationController,
                      width: double.infinity,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 24),

                    // 벌칙 입력 (optional)
                    AppTextField(
                      label: '벌칙 (선택)',
                      hintText: '지각 시 벌칙을 입력해주세요',
                      controller: _penaltyController,
                      width: double.infinity,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // 하단 버튼
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: PrimaryButton(
                text: '약속 추가하기',
                isEnabled: _isFormValid,
                width: double.infinity,
                onPressed: _onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

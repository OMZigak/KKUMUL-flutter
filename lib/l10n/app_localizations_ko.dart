// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '꾸물꿈';

  @override
  String get navHome => '홈';

  @override
  String get navMyGroups => '내 모임';

  @override
  String get navMyPage => '마이페이지';

  @override
  String get homeWelcomeUser => '꾸물리안 님,';

  @override
  String homeAppointmentCount(int count) {
    return '$count번';
  }

  @override
  String get homeAppointmentSuffix => '의 약속에서';

  @override
  String homeLateCount(int count) {
    return '$count번';
  }

  @override
  String get homeLateSuffix => ' 꾸물거렸어요!';

  @override
  String get homeWelcomeBubble => '꾸물꿈에 오신 것을 환영해요!\n정시 도착으로 캐릭터를 성장시켜 보세요.';

  @override
  String get homeLevelChip => '빼꼼 꾸물이';

  @override
  String get homeNearestAppointment => '가까운 약속은?';

  @override
  String get homeUpcomingAppointments => '다가올 나의 약속은?';

  @override
  String get groupTitle => '내 모임';

  @override
  String get groupAddButton => '모임 추가하기';

  @override
  String get groupEmptyTitle => '아직 모임이 없네요!\n모임을 추가해 보세요.';

  @override
  String get groupTotalCount => '총 ';

  @override
  String get groupTotalSuffix => '개예요!';

  @override
  String get groupNextAppointment => '다음 약속';

  @override
  String get groupJoinedCountPrefix => '님이 가입한 모임은';

  @override
  String get createGroupTitle => '모임 이름을\n입력해 주세요';

  @override
  String get createGroupHint => '모임 이름 입력';

  @override
  String get createGroupConfirm => '확인';

  @override
  String get createGroupFailed => '모임 생성에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get createGroupCodeCopied => '초대 코드가 복사되었습니다.';

  @override
  String get addGroupInviteSubtitle => '초대 코드를 받았다면';

  @override
  String get addGroupInviteTitle => '초대 코드 입력하기';

  @override
  String get addGroupCreateSubtitle => '초대 코드가 없다면';

  @override
  String get addGroupCreateTitle => '직접 모임 추가하기';

  @override
  String get inviteDialogTitle => '초대 코드 공유하기';

  @override
  String get inviteDialogDescription => '친구에게 초대 코드를 공유해\n함께 모임에 참여하세요!';

  @override
  String get inviteDialogLater => '나중에';

  @override
  String get inviteDialogCopy => '코드 복사';

  @override
  String get myPageTitle => '마이페이지';

  @override
  String get myPageUserName => '꾸물리안 님';

  @override
  String get myPagePushNotification => '내 푸쉬 알림';

  @override
  String get myPagePushDescription => '준비, 이동을 시작해야할 시간에\n푸쉬 알림을 받을 수 있습니다.';

  @override
  String get myPageVersion => '버전정보';

  @override
  String get myPageTerms => '이용약관';

  @override
  String get myPageLogout => '로그아웃';

  @override
  String get myPageWithdraw => '탈퇴하기';

  @override
  String get myPageLogoutConfirm => '정말 로그아웃 하시겠습니까?';

  @override
  String get myPageWithdrawConfirm => '정말 탈퇴하시겠습니까?\n탈퇴 시 모든 데이터가 삭제됩니다.';

  @override
  String get myPageLevelPrefix => '지각대장 꾸물이';

  @override
  String get appointmentEdit => '약속 수정';

  @override
  String get appointmentDelete => '약속 삭제';

  @override
  String get appointmentDeleteConfirm => '정말로 이 약속을 삭제하시겠습니까?';

  @override
  String get appointmentShareLink => '초대 링크 공유';

  @override
  String get appointmentMembers => '참여 멤버';

  @override
  String get appointmentPenalty => '지각 벌칙';

  @override
  String get appointmentViewStatus => '준비 현황 보기';

  @override
  String get appointmentInputInfo => '준비 정보 입력하기';

  @override
  String get appointmentInputInfoNav => '준비 정보 입력 화면으로 이동합니다.';

  @override
  String get tabAppointmentInfo => '약속 정보';

  @override
  String get tabPreparationStatus => '준비 현황';

  @override
  String get tabLateMembers => '지각 꾸물이';

  @override
  String get labelDate => '날짜';

  @override
  String get labelTime => '시간';

  @override
  String get labelLocation => '장소';

  @override
  String get myPreparationStatus => '나의 준비 현황';

  @override
  String get teamPreparationStatus => '우리들의 준비 현황';

  @override
  String get noLateMembers => '지각한 사람이 없어요!';

  @override
  String get allOnTime => '모두 제시간에 도착했습니다';

  @override
  String get statusBefore => '꾸물중';

  @override
  String get statusReady => '준비중';

  @override
  String get statusReadyShort => '준비 중';

  @override
  String get statusMove => '이동중';

  @override
  String get statusMoveStart => '이동 시작';

  @override
  String get statusArrive => '도착';

  @override
  String get statusArriveComplete => '도착 완료';

  @override
  String get statusWaiting => '대기중';

  @override
  String get statusDepart => '출발';

  @override
  String get helpMessageMove => '이동을 시작 시 눌러주세요';

  @override
  String get helpMessagePress => '버튼을 눌러주세요';

  @override
  String get popupNoTime => '꾸물거릴 시간이 없어요!';

  @override
  String get buttonCancel => '취소';

  @override
  String get buttonDelete => '삭제';

  @override
  String get buttonConfirm => '확인';

  @override
  String get kakaoLogin => '카카오로 로그인';

  @override
  String get weekdayMon => '월';

  @override
  String get weekdayTue => '화';

  @override
  String get weekdayWed => '수';

  @override
  String get weekdayThu => '목';

  @override
  String get weekdayFri => '금';

  @override
  String get weekdaySat => '토';

  @override
  String get weekdaySun => '일';

  @override
  String get periodAM => '오전';

  @override
  String get periodPM => '오후';
}

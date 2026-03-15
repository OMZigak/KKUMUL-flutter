// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Kkumul';

  @override
  String get navHome => 'Home';

  @override
  String get navMyGroups => 'My Groups';

  @override
  String get navMyPage => 'My Page';

  @override
  String get homeWelcomeUser => 'Hello,';

  @override
  String homeAppointmentCount(int count) {
    return '$count times';
  }

  @override
  String get homeAppointmentSuffix => ' in appointments';

  @override
  String homeLateCount(int count) {
    return '$count times';
  }

  @override
  String get homeLateSuffix => ' you were late!';

  @override
  String get homeWelcomeBubble =>
      'Welcome to Kkumul!\nGrow your character by arriving on time.';

  @override
  String get homeLevelChip => 'Peeking Kkumul';

  @override
  String get homeNearestAppointment => 'Nearest appointment?';

  @override
  String get homeUpcomingAppointments => 'Upcoming appointments?';

  @override
  String get groupTitle => 'My Groups';

  @override
  String get groupAddButton => 'Add Group';

  @override
  String get groupEmptyTitle => 'No groups yet!\nTry adding a group.';

  @override
  String get groupTotalCount => 'Total ';

  @override
  String get groupTotalSuffix => ' groups!';

  @override
  String get groupNextAppointment => 'Next appointment';

  @override
  String get groupJoinedCountPrefix => '\'s joined groups:';

  @override
  String get createGroupTitle => 'Enter the\ngroup name';

  @override
  String get createGroupHint => 'Enter group name';

  @override
  String get createGroupConfirm => 'Confirm';

  @override
  String get createGroupFailed => 'Failed to create group. Please try again.';

  @override
  String get createGroupCodeCopied => 'Invite code copied.';

  @override
  String get addGroupInviteSubtitle => 'If you have an invite code';

  @override
  String get addGroupInviteTitle => 'Enter invite code';

  @override
  String get addGroupCreateSubtitle => 'If you don\'t have an invite code';

  @override
  String get addGroupCreateTitle => 'Create a new group';

  @override
  String get inviteDialogTitle => 'Share invite code';

  @override
  String get inviteDialogDescription =>
      'Share the invite code with friends\nto join the group together!';

  @override
  String get inviteDialogLater => 'Later';

  @override
  String get inviteDialogCopy => 'Copy code';

  @override
  String get myPageTitle => 'My Page';

  @override
  String get myPageUserName => 'User';

  @override
  String get myPagePushNotification => 'Push notifications';

  @override
  String get myPagePushDescription =>
      'Receive push notifications when it\'s time\nto prepare or start moving.';

  @override
  String get myPageVersion => 'Version';

  @override
  String get myPageTerms => 'Terms of Service';

  @override
  String get myPageLogout => 'Logout';

  @override
  String get myPageWithdraw => 'Delete Account';

  @override
  String get myPageLogoutConfirm => 'Are you sure you want to logout?';

  @override
  String get myPageWithdrawConfirm =>
      'Are you sure you want to delete your account?\nAll data will be permanently deleted.';

  @override
  String get myPageLevelPrefix => 'Late Master Kkumul';

  @override
  String get appointmentEdit => 'Edit appointment';

  @override
  String get appointmentDelete => 'Delete appointment';

  @override
  String get appointmentDeleteConfirm =>
      'Are you sure you want to delete this appointment?';

  @override
  String get appointmentShareLink => 'Share invite link';

  @override
  String get appointmentMembers => 'Members';

  @override
  String get appointmentPenalty => 'Late penalty';

  @override
  String get appointmentViewStatus => 'View status';

  @override
  String get appointmentInputInfo => 'Enter preparation info';

  @override
  String get appointmentInputInfoNav => 'Navigate to preparation info screen.';

  @override
  String get tabAppointmentInfo => 'Appointment Info';

  @override
  String get tabPreparationStatus => 'Preparation Status';

  @override
  String get tabLateMembers => 'Late Members';

  @override
  String get labelDate => 'Date';

  @override
  String get labelTime => 'Time';

  @override
  String get labelLocation => 'Location';

  @override
  String get myPreparationStatus => 'My preparation status';

  @override
  String get teamPreparationStatus => 'Team preparation status';

  @override
  String get noLateMembers => 'No one was late!';

  @override
  String get allOnTime => 'Everyone arrived on time';

  @override
  String get statusBefore => 'Waiting';

  @override
  String get statusReady => 'Preparing';

  @override
  String get statusReadyShort => 'Ready';

  @override
  String get statusMove => 'Moving';

  @override
  String get statusMoveStart => 'Start moving';

  @override
  String get statusArrive => 'Arrived';

  @override
  String get statusArriveComplete => 'Arrival complete';

  @override
  String get statusWaiting => 'Waiting';

  @override
  String get statusDepart => 'Depart';

  @override
  String get helpMessageMove => 'Press when you start moving';

  @override
  String get helpMessagePress => 'Press the button';

  @override
  String get popupNoTime => 'No time to delay!';

  @override
  String get buttonCancel => 'Cancel';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get buttonConfirm => 'Confirm';

  @override
  String get kakaoLogin => 'Login with Kakao';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get periodAM => 'AM';

  @override
  String get periodPM => 'PM';
}

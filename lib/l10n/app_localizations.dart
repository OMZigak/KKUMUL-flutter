import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// App title
  ///
  /// In ko, this message translates to:
  /// **'꾸물꿈'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In ko, this message translates to:
  /// **'홈'**
  String get navHome;

  /// No description provided for @navMyGroups.
  ///
  /// In ko, this message translates to:
  /// **'내 모임'**
  String get navMyGroups;

  /// No description provided for @navMyPage.
  ///
  /// In ko, this message translates to:
  /// **'마이페이지'**
  String get navMyPage;

  /// Welcome message with user name
  ///
  /// In ko, this message translates to:
  /// **'꾸물리안 님,'**
  String get homeWelcomeUser;

  /// No description provided for @homeAppointmentCount.
  ///
  /// In ko, this message translates to:
  /// **'{count}번'**
  String homeAppointmentCount(int count);

  /// No description provided for @homeAppointmentSuffix.
  ///
  /// In ko, this message translates to:
  /// **'의 약속에서'**
  String get homeAppointmentSuffix;

  /// No description provided for @homeLateCount.
  ///
  /// In ko, this message translates to:
  /// **'{count}번'**
  String homeLateCount(int count);

  /// No description provided for @homeLateSuffix.
  ///
  /// In ko, this message translates to:
  /// **' 꾸물거렸어요!'**
  String get homeLateSuffix;

  /// No description provided for @homeWelcomeBubble.
  ///
  /// In ko, this message translates to:
  /// **'꾸물꿈에 오신 것을 환영해요!\n정시 도착으로 캐릭터를 성장시켜 보세요.'**
  String get homeWelcomeBubble;

  /// No description provided for @homeLevelChip.
  ///
  /// In ko, this message translates to:
  /// **'빼꼼 꾸물이'**
  String get homeLevelChip;

  /// No description provided for @homeNearestAppointment.
  ///
  /// In ko, this message translates to:
  /// **'가까운 약속은?'**
  String get homeNearestAppointment;

  /// No description provided for @homeUpcomingAppointments.
  ///
  /// In ko, this message translates to:
  /// **'다가올 나의 약속은?'**
  String get homeUpcomingAppointments;

  /// No description provided for @groupTitle.
  ///
  /// In ko, this message translates to:
  /// **'내 모임'**
  String get groupTitle;

  /// No description provided for @groupAddButton.
  ///
  /// In ko, this message translates to:
  /// **'모임 추가하기'**
  String get groupAddButton;

  /// No description provided for @groupEmptyTitle.
  ///
  /// In ko, this message translates to:
  /// **'아직 모임이 없네요!\n모임을 추가해 보세요.'**
  String get groupEmptyTitle;

  /// No description provided for @groupTotalCount.
  ///
  /// In ko, this message translates to:
  /// **'총 '**
  String get groupTotalCount;

  /// No description provided for @groupTotalSuffix.
  ///
  /// In ko, this message translates to:
  /// **'개예요!'**
  String get groupTotalSuffix;

  /// No description provided for @groupNextAppointment.
  ///
  /// In ko, this message translates to:
  /// **'다음 약속'**
  String get groupNextAppointment;

  /// No description provided for @groupJoinedCountPrefix.
  ///
  /// In ko, this message translates to:
  /// **'님이 가입한 모임은'**
  String get groupJoinedCountPrefix;

  /// No description provided for @createGroupTitle.
  ///
  /// In ko, this message translates to:
  /// **'모임 이름을\n입력해 주세요'**
  String get createGroupTitle;

  /// No description provided for @createGroupHint.
  ///
  /// In ko, this message translates to:
  /// **'모임 이름 입력'**
  String get createGroupHint;

  /// No description provided for @createGroupConfirm.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get createGroupConfirm;

  /// No description provided for @createGroupFailed.
  ///
  /// In ko, this message translates to:
  /// **'모임 생성에 실패했습니다. 다시 시도해 주세요.'**
  String get createGroupFailed;

  /// No description provided for @createGroupCodeCopied.
  ///
  /// In ko, this message translates to:
  /// **'초대 코드가 복사되었습니다.'**
  String get createGroupCodeCopied;

  /// No description provided for @addGroupInviteSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'초대 코드를 받았다면'**
  String get addGroupInviteSubtitle;

  /// No description provided for @addGroupInviteTitle.
  ///
  /// In ko, this message translates to:
  /// **'초대 코드 입력하기'**
  String get addGroupInviteTitle;

  /// No description provided for @addGroupCreateSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'초대 코드가 없다면'**
  String get addGroupCreateSubtitle;

  /// No description provided for @addGroupCreateTitle.
  ///
  /// In ko, this message translates to:
  /// **'직접 모임 추가하기'**
  String get addGroupCreateTitle;

  /// No description provided for @inviteDialogTitle.
  ///
  /// In ko, this message translates to:
  /// **'초대 코드 공유하기'**
  String get inviteDialogTitle;

  /// No description provided for @inviteDialogDescription.
  ///
  /// In ko, this message translates to:
  /// **'친구에게 초대 코드를 공유해\n함께 모임에 참여하세요!'**
  String get inviteDialogDescription;

  /// No description provided for @inviteDialogLater.
  ///
  /// In ko, this message translates to:
  /// **'나중에'**
  String get inviteDialogLater;

  /// No description provided for @inviteDialogCopy.
  ///
  /// In ko, this message translates to:
  /// **'코드 복사'**
  String get inviteDialogCopy;

  /// No description provided for @myPageTitle.
  ///
  /// In ko, this message translates to:
  /// **'마이페이지'**
  String get myPageTitle;

  /// No description provided for @myPageUserName.
  ///
  /// In ko, this message translates to:
  /// **'꾸물리안 님'**
  String get myPageUserName;

  /// No description provided for @myPagePushNotification.
  ///
  /// In ko, this message translates to:
  /// **'내 푸쉬 알림'**
  String get myPagePushNotification;

  /// No description provided for @myPagePushDescription.
  ///
  /// In ko, this message translates to:
  /// **'준비, 이동을 시작해야할 시간에\n푸쉬 알림을 받을 수 있습니다.'**
  String get myPagePushDescription;

  /// No description provided for @myPageVersion.
  ///
  /// In ko, this message translates to:
  /// **'버전정보'**
  String get myPageVersion;

  /// No description provided for @myPageTerms.
  ///
  /// In ko, this message translates to:
  /// **'이용약관'**
  String get myPageTerms;

  /// No description provided for @myPageLogout.
  ///
  /// In ko, this message translates to:
  /// **'로그아웃'**
  String get myPageLogout;

  /// No description provided for @myPageWithdraw.
  ///
  /// In ko, this message translates to:
  /// **'탈퇴하기'**
  String get myPageWithdraw;

  /// No description provided for @myPageLogoutConfirm.
  ///
  /// In ko, this message translates to:
  /// **'정말 로그아웃 하시겠습니까?'**
  String get myPageLogoutConfirm;

  /// No description provided for @myPageWithdrawConfirm.
  ///
  /// In ko, this message translates to:
  /// **'정말 탈퇴하시겠습니까?\n탈퇴 시 모든 데이터가 삭제됩니다.'**
  String get myPageWithdrawConfirm;

  /// No description provided for @myPageLevelPrefix.
  ///
  /// In ko, this message translates to:
  /// **'지각대장 꾸물이'**
  String get myPageLevelPrefix;

  /// No description provided for @appointmentEdit.
  ///
  /// In ko, this message translates to:
  /// **'약속 수정'**
  String get appointmentEdit;

  /// No description provided for @appointmentDelete.
  ///
  /// In ko, this message translates to:
  /// **'약속 삭제'**
  String get appointmentDelete;

  /// No description provided for @appointmentDeleteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'정말로 이 약속을 삭제하시겠습니까?'**
  String get appointmentDeleteConfirm;

  /// No description provided for @appointmentShareLink.
  ///
  /// In ko, this message translates to:
  /// **'초대 링크 공유'**
  String get appointmentShareLink;

  /// No description provided for @appointmentMembers.
  ///
  /// In ko, this message translates to:
  /// **'참여 멤버'**
  String get appointmentMembers;

  /// No description provided for @appointmentPenalty.
  ///
  /// In ko, this message translates to:
  /// **'지각 벌칙'**
  String get appointmentPenalty;

  /// No description provided for @appointmentViewStatus.
  ///
  /// In ko, this message translates to:
  /// **'준비 현황 보기'**
  String get appointmentViewStatus;

  /// No description provided for @appointmentInputInfo.
  ///
  /// In ko, this message translates to:
  /// **'준비 정보 입력하기'**
  String get appointmentInputInfo;

  /// No description provided for @appointmentInputInfoNav.
  ///
  /// In ko, this message translates to:
  /// **'준비 정보 입력 화면으로 이동합니다.'**
  String get appointmentInputInfoNav;

  /// No description provided for @tabAppointmentInfo.
  ///
  /// In ko, this message translates to:
  /// **'약속 정보'**
  String get tabAppointmentInfo;

  /// No description provided for @tabPreparationStatus.
  ///
  /// In ko, this message translates to:
  /// **'준비 현황'**
  String get tabPreparationStatus;

  /// No description provided for @tabLateMembers.
  ///
  /// In ko, this message translates to:
  /// **'지각 꾸물이'**
  String get tabLateMembers;

  /// No description provided for @labelDate.
  ///
  /// In ko, this message translates to:
  /// **'날짜'**
  String get labelDate;

  /// No description provided for @labelTime.
  ///
  /// In ko, this message translates to:
  /// **'시간'**
  String get labelTime;

  /// No description provided for @labelLocation.
  ///
  /// In ko, this message translates to:
  /// **'장소'**
  String get labelLocation;

  /// No description provided for @myPreparationStatus.
  ///
  /// In ko, this message translates to:
  /// **'나의 준비 현황'**
  String get myPreparationStatus;

  /// No description provided for @teamPreparationStatus.
  ///
  /// In ko, this message translates to:
  /// **'우리들의 준비 현황'**
  String get teamPreparationStatus;

  /// No description provided for @noLateMembers.
  ///
  /// In ko, this message translates to:
  /// **'지각한 사람이 없어요!'**
  String get noLateMembers;

  /// No description provided for @allOnTime.
  ///
  /// In ko, this message translates to:
  /// **'모두 제시간에 도착했습니다'**
  String get allOnTime;

  /// No description provided for @statusBefore.
  ///
  /// In ko, this message translates to:
  /// **'꾸물중'**
  String get statusBefore;

  /// No description provided for @statusReady.
  ///
  /// In ko, this message translates to:
  /// **'준비중'**
  String get statusReady;

  /// No description provided for @statusReadyShort.
  ///
  /// In ko, this message translates to:
  /// **'준비 중'**
  String get statusReadyShort;

  /// No description provided for @statusMove.
  ///
  /// In ko, this message translates to:
  /// **'이동중'**
  String get statusMove;

  /// No description provided for @statusMoveStart.
  ///
  /// In ko, this message translates to:
  /// **'이동 시작'**
  String get statusMoveStart;

  /// No description provided for @statusArrive.
  ///
  /// In ko, this message translates to:
  /// **'도착'**
  String get statusArrive;

  /// No description provided for @statusArriveComplete.
  ///
  /// In ko, this message translates to:
  /// **'도착 완료'**
  String get statusArriveComplete;

  /// No description provided for @statusWaiting.
  ///
  /// In ko, this message translates to:
  /// **'대기중'**
  String get statusWaiting;

  /// No description provided for @statusDepart.
  ///
  /// In ko, this message translates to:
  /// **'출발'**
  String get statusDepart;

  /// No description provided for @helpMessageMove.
  ///
  /// In ko, this message translates to:
  /// **'이동을 시작 시 눌러주세요'**
  String get helpMessageMove;

  /// No description provided for @helpMessagePress.
  ///
  /// In ko, this message translates to:
  /// **'버튼을 눌러주세요'**
  String get helpMessagePress;

  /// No description provided for @popupNoTime.
  ///
  /// In ko, this message translates to:
  /// **'꾸물거릴 시간이 없어요!'**
  String get popupNoTime;

  /// No description provided for @buttonCancel.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get buttonCancel;

  /// No description provided for @buttonDelete.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get buttonDelete;

  /// No description provided for @buttonConfirm.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get buttonConfirm;

  /// No description provided for @kakaoLogin.
  ///
  /// In ko, this message translates to:
  /// **'카카오로 로그인'**
  String get kakaoLogin;

  /// No description provided for @weekdayMon.
  ///
  /// In ko, this message translates to:
  /// **'월'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In ko, this message translates to:
  /// **'화'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In ko, this message translates to:
  /// **'수'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In ko, this message translates to:
  /// **'목'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In ko, this message translates to:
  /// **'금'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In ko, this message translates to:
  /// **'토'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In ko, this message translates to:
  /// **'일'**
  String get weekdaySun;

  /// No description provided for @periodAM.
  ///
  /// In ko, this message translates to:
  /// **'오전'**
  String get periodAM;

  /// No description provided for @periodPM.
  ///
  /// In ko, this message translates to:
  /// **'오후'**
  String get periodPM;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

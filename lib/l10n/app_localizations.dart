import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// Login word
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// sign-up word
  ///
  /// In en, this message translates to:
  /// **'Sign-Up'**
  String get sign_up;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get are_you_sure;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgot_password;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Password confirmation'**
  String get password_confirmation;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Register now'**
  String get register_now;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Continue with apple'**
  String get continue_with_apple;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Continue with google'**
  String get continue_with_google;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get delete_my_account;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  ///
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Hello world
  ///
  /// In en, this message translates to:
  /// **'Add some rooms'**
  String get add_rooms;

  /// Login word
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// sign-up word
  ///
  /// In en, this message translates to:
  /// **'Search for out nearby hotel'**
  String get search_field_hint;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'A Hotel for every moment rich in emotion'**
  String get welcome_card_title;

  /// Hello world
  ///
  /// In en, this message translates to:
  /// **'Book now'**
  String get book_now;

  /// Login word
  ///
  /// In en, this message translates to:
  /// **'Choose a room'**
  String get choose_a_room;

  /// sign-up word
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get view_all;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get rooms;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get past;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get first_name;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'last_name'**
  String get last_name;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// Email word
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

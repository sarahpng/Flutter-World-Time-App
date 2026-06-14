import 'package:world_time/services/app_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  AppCache._();

  static AppCache? _instance;
  static SharedPreferences? _prefs;
  static const String _languageKey = 'app_language';

  static AppCache get ins {
    _instance ??= AppCache._();
    return _instance!;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _onboardingKey = 'onboarding_viewed';

  /// Sets onboarding view to cache
  Future<void> setOnboardingViewed() async {
    try {
      'Onboarding viewed cached'.appLog(
        tag: 'APP_CACHE: setOnboardingViewed()',
        toCrashlytics: true,
      );
      await _prefs!.setBool(_onboardingKey, true);
    } catch (e) {
      'Error caching onboarding view: $e'.appLog(
        tag: 'APP_CACHE: setOnboardingViewed()',
        level: .error,
      );
    }
  }

  /// Gets onboarding view from cache
  bool get isOnboardingViewed => _prefs?.getBool(_onboardingKey) ?? false;

  Future<void> setLanguage(String language) async {
    await _prefs!.setString(_languageKey, language);
  }

  String get language => _prefs?.getString(_languageKey) ?? 'en';

  /// Sets get started view to cache

  Future<void> reset() async {
    await _prefs?.clear();
  }
}

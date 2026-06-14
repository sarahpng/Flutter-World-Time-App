import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/services/cache/app_cache.dart';

enum LanguageCache { locale }

class LanguageProvider extends ChangeNotifier {
  static LanguageProvider s(BuildContext context, [bool listen = false]) =>
      Provider.of<LanguageProvider>(context, listen: listen);

  Locale currentLocale = const Locale('en');

  LanguageProvider() {
    _init();
  }

  void _init() async {
    final cachedLocale = AppCache.ins.language;
    if (cachedLocale.isNotEmpty) {
      final parts = cachedLocale.split('_');
      if (parts.length > 1) {
        currentLocale = Locale(parts[0], parts[1]);
      } else {
        currentLocale = Locale(parts[0]);
      }
    }

    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    if (currentLocale == newLocale) return;
    currentLocale = newLocale;
    notifyListeners();
    final localeStr = newLocale.countryCode != null
        ? '${newLocale.languageCode}_${newLocale.countryCode}'
        : newLocale.languageCode;
    AppCache.ins.setLanguage(localeStr);
  }
}

extension LanguageCodeToName on String {
  String toLocaleName() {
    switch (this) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'fa':
        return 'فارسی';
      case 'fr':
        return 'Français';
      case 'hi':
        return 'हिन्दी';
      case 'it':
        return 'Italiano';
      case 'pt':
        return 'Português';
      case 'ru':
        return 'Русский';
      case 'zh':
        return '中文';

      default:
        return this;
    }
  }
}

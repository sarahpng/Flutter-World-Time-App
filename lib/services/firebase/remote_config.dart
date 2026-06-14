import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  static final RemoteConfigService ins = RemoteConfigService._();
  RemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static const String _isAdsEnabledKey = 'is_ads_enabled';

  static const String _isBottomBarBannerEnabledKey =
      'is_bottom_bar_banner_enabled';

  static const String _isSplashInterstitialEnabledKey =
      "is_splash_interstitial_enabled";

  static const String _isPickerInterstitialEnabledKey =
      "is_picker_interstitial_enabled";

  static const String _isScanNowInterstitialEnabledKey =
      "is_scan_now_interstitial_enabled";

  static const String _isTabShiftInterstitialEnabledKey =
      "is_tab_shift_interstitial_enabled";

  static const String _isScanPlantNativeAdEnabledKey =
      "is_scan_plant_native_ad_enabled";

  static const String _isPlantInfoNativeAdEnabledKey =
      "is_plant_info_native_ad_enabled";

  static const String _isLanguageNativeAdEnabledKey =
      "is_language_native_ad_enabled";

  static const String _adShowCounterOnBottomBarKey =
      "ad_show_counter_on_bottombar";

  Future<void> init() async {
    try {
      await _remoteConfig.setDefaults({
        _isAdsEnabledKey: true,
        _isBottomBarBannerEnabledKey: true,
        _isSplashInterstitialEnabledKey: true,
        _isPickerInterstitialEnabledKey: true,
        _isScanNowInterstitialEnabledKey: true,
        _isTabShiftInterstitialEnabledKey: true,
        _isScanPlantNativeAdEnabledKey: true,
        _isPlantInfoNativeAdEnabledKey: true,
        _isLanguageNativeAdEnabledKey: true,
        _adShowCounterOnBottomBarKey: 2,
      });
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: kDebugMode
              ? Duration.zero
              : const Duration(hours: 1),
        ),
      );
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('RemoteConfig init error: $e');
    }
  }

  bool get isAdsEnabled => _remoteConfig.getBool(_isAdsEnabledKey);
  bool get isBottomBarBannerEnabled =>
      _remoteConfig.getBool(_isBottomBarBannerEnabledKey);
  bool get isSplashInterstitialEnabled =>
      _remoteConfig.getBool(_isSplashInterstitialEnabledKey);
  bool get isPickerInterstitialEnabled =>
      _remoteConfig.getBool(_isPickerInterstitialEnabledKey);
  bool get isScanNowInterstitialEnabled =>
      _remoteConfig.getBool(_isScanNowInterstitialEnabledKey);
  bool get isTabShiftInterstitialEnabled =>
      _remoteConfig.getBool(_isTabShiftInterstitialEnabledKey);
  bool get isScanPlantNativeAdEnabled =>
      _remoteConfig.getBool(_isScanPlantNativeAdEnabledKey);
  bool get isPlantInfoNativeAdEnabled =>
      _remoteConfig.getBool(_isPlantInfoNativeAdEnabledKey);
  bool get isLanguageNativeAdEnabled =>
      _remoteConfig.getBool(_isLanguageNativeAdEnabledKey);
  int get adShowCounterOnBottomBar =>
      _remoteConfig.getInt(_adShowCounterOnBottomBarKey);
  // bool get isAdsEnabled => false;
}

import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:world_time/services/app_log.dart';
import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

class DeviceInfo {
  static late final PackageInfo _packageInfo;
  static String packageName = '';
  static int buildNo = 0;
  static String version = '';
  static String deviceId = '';

  static Future<void> init() async {
    try {
      _packageInfo = await PackageInfo.fromPlatform();
      packageName = _packageInfo.packageName;
      version = _packageInfo.version;
      buildNo =
          int.tryParse(
            _packageInfo.buildNumber.replaceAll(RegExp('[^0-9]'), ''),
          ) ??
          0;

      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
      } else if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        final bytes = utf8.encode(androidInfo.id);
        final time = bytes.reduce((a, b) => a + b);
        deviceId = const Uuid().v7(config: V7Options(time, bytes));
      } else {
        deviceId = 'unknown_platform';
      }
    } catch (e) {
      e.appLog(level: AppLogLevel.error, tag: 'DEVICE_INFO_INIT');
      // Ensure defaults are set if not already
      packageName = packageName.isEmpty ? 'unknown' : packageName;
      version = version.isEmpty ? '0.0.0' : version;
      deviceId = deviceId.isEmpty ? 'unknown_device' : deviceId;
    }
  }
}

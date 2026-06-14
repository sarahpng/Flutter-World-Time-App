import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService ins = NotificationService._();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
  );

  Future<void> init() async {
    // 1. Setup Local Notifications (Always works independently)
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();

    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    // 2. Create the Android Notification Channel
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);

    // 3. Initialize Firebase Messaging (Wrapped in try-catch to prevent crashes)
    try {
      // Subscribe to general topic (for bulk notifications from console)
      await FirebaseMessaging.instance.subscribeToTopic('all_users');

      // Set Foreground Presentation Options
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );

      // Listen for foreground messages
      FirebaseMessaging.onMessage.listen(_showForegroundNotification);

      // Handle notification tap when the app is in the background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (kDebugMode) {
          print(
            "Notification tapped while app was in background: ${message.data}",
          );
        }
      });

      // Handle notification tap when the app was terminated
      final initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();
      if (initialMessage != null) {
        if (kDebugMode) {
          print(
            "Notification tapped while app was terminated: ${initialMessage.data}",
          );
        }
      }
    } catch (e) {
      // If Firebase service is unavailable, we log it but don't crash.
      if (kDebugMode) {
        print("Firebase Messaging initialization failed: $e");
      }
    }
  }

  Future<void> requestPermission() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      if (kDebugMode) {
        print("Failed to request notification permission: $e");
      }
    }
  }

  void _showForegroundNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _localNotifications.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            icon: android.smallIcon,
          ),
        ),
      );
    }
  }

  // Define background message handler
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    // If you need to initialize other services to handle the background message,
    // like recording stats or similar, do it here.
    if (kDebugMode) {
      print("Handling a background message: ${message.messageId}");
    }

    // Note: To show local notifications here, you'd need to re-initialize
    // FlutterLocalNotificationsPlugin because this runs in a separate isolate.
  }
}

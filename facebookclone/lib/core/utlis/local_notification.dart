import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    var androidInitialize =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitialize);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint("-- ressponse -- ${details.payload}");
      },
    );

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '...',
      '...',
      importance: Importance.max,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    FirebaseMessaging.onMessage.listen(
      (event) async {
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${event.data}');
        if (event.notification != null) {
          await flutterLocalNotificationsPlugin.show(
            0,
            event.notification?.title,
            event.notification?.body,
            notificationDetails,
          );
        }
      },
    );
  }
}

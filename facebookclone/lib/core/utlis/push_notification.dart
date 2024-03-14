import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${message.data}');
        if (message.notification != null) {
          debugPrint(
            'Message also contained a notification: ${message.notification}',
          );
        }
      },
    );
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    log("----- TOKEN ------ $token");
    debugPrint('Token: $token');
    return token;
  }
}

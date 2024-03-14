import 'package:facebookclone/View/login/login_page.dart';
import 'package:facebookclone/core/utlis/local_notification.dart';

import 'package:facebookclone/core/utlis/push_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationService _pushNotificationService =
      PushNotificationService();

  final LocalNotificationService _localNotificationService =
      LocalNotificationService();

  @override
  void initState() {
    super.initState();
    _pushNotificationService.initialize();
    _localNotificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

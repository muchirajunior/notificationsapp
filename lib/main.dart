import 'package:flutter/material.dart';
import 'package:notificationapp/home.dart';
import 'package:notificationapp/local_notification_service.dart';
import 'package:notificationapp/notification_service.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  // Always initialize Awesome Notifications
  await NotificationService.initializeAwesomeNotifications();
  await LocalNotficationService.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: MyApp.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade900),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}

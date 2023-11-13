import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotficationService{

  static Future initializeLocalNotifications()async{
    const InitializationSettings settings= InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
          macOS:DarwinInitializationSettings(),
          linux: LinuxInitializationSettings(defaultActionName: 'notification') 
        );
    await FlutterLocalNotificationsPlugin().initialize(settings);
  } 

  static NotificationDetails _notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails('notification', 'Notifications'),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
      linux: LinuxNotificationDetails()
    );
  }

   Future showLocalNotification()async{
    // final localNotificationService= await initializeLocalNotifications();
    await FlutterLocalNotificationsPlugin().show(-1, 'local noti', 'Flutter local notifications', _notificationDetails());
  }
}
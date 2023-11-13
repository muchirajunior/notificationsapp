import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notificationapp/main.dart';
import 'package:notificationapp/notification_screen.dart';

class LocalNotficationService{

  static Future initializeLocalNotifications()async{
    const InitializationSettings settings= InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
          macOS:DarwinInitializationSettings(),
          linux: LinuxInitializationSettings(defaultActionName: 'notification') 
        );
    
    await FlutterLocalNotificationsPlugin().initialize(
        settings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse
      
      );
  } 

  static NotificationDetails _notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails('notification', 'Notifications', fullScreenIntent: true),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
      linux: LinuxNotificationDetails()
    );
  }

  ///This methods shows a static noitification
  ///
  ///add some parameter like id,title,body and payload to customize. 
  ///The [payload] will be a string but we use jsonencode to convert it from Map
  static Future showLocalNotification()async{
    var payload=jsonEncode({
      'message':'This is a sample message',
      'body':'as long as this text is readable to the user it okey and good'
    });
    await FlutterLocalNotificationsPlugin().show(-1, 'local noti', 'Flutter local notifications', _notificationDetails(), payload: payload);
  }

  ///This creates a repeated notification after every min
  ///
  ///add paramameters to change it to notification of your like
  static Future scheduleLocalNotification()async{
    var payload=jsonEncode({
      'message':'This is a sample message',
      'body':'as long as this text is readable to the user it okey and good'
    });
    await FlutterLocalNotificationsPlugin().periodicallyShow(-1, 'local noti', 'Flutter local notifications',RepeatInterval.everyMinute,_notificationDetails(),payload: payload);
  }

  static void _onDidReceiveNotificationResponse(NotificationResponse details) {
    debugPrint(details.payload);
    MyApp.navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>NotificationScreen(payload: jsonDecode(details.payload!))));

  }
}
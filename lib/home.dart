
import 'package:flutter/material.dart';
import 'package:notificationapp/local_notification_service.dart';
import 'package:notificationapp/notification_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  showNoti()async{
    await Future.delayed(const Duration(seconds: 5));
    NotificationService.showInAppNotification();
  }

  @override
  void initState() {
    showNoti();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        elevation: 1,
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: NotificationService.createNotification, child: Text('awesome noti')),
            SizedBox(height: 30,),
            FilledButton(onPressed: LocalNotficationService.showLocalNotification, child: Text('local noti')),
            SizedBox(height: 30,),
            FilledButton(onPressed: LocalNotficationService.scheduleLocalNotification, child: Text('repeated local noti'))
          ],
        ),
      ),

      floatingActionButton: const FloatingActionButton(
        onPressed: NotificationService.showInAppNotification,
        child: Icon(Icons.add),
      ),
    );
  }
}
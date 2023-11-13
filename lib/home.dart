
import 'package:flutter/material.dart';
import 'package:notificationapp/local_notification_service.dart';
import 'package:notificationapp/notification_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var service=LocalNotficationService();

  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        elevation: 3,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(onPressed: NotificationService.createNotification, child: Text('awesome noti')),
            SizedBox(height: 30,),
            FilledButton(onPressed: () async=>await service.showLocalNotification(), child: Text('local noti'))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>NotificationService.showAlertNotification(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
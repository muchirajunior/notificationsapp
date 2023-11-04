
import 'package:flutter/material.dart';
import 'package:notificationapp/notification_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>NotificationService.showAlertNotification(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
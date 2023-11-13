import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final Map payload;
  const NotificationScreen({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Screen'),
        elevation: 1,
      ),

      body: Center(
        child: Text(payload['message']),
      ),
    );
  }
}
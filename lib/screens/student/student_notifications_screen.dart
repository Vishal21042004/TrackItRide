// lib/screens/student/student_notifications_screen.dart

import 'package:flutter/material.dart';

class StudentNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: ListView.builder(
        itemCount: 3, // Placeholder for number of notifications
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification ${index + 1}'),
            subtitle: Text('Bus is near your stop!'),
          );
        },
      ),
    );
  }
}

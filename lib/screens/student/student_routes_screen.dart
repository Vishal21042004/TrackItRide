// lib/screens/student/student_routes_screen.dart

import 'package:flutter/material.dart';

class StudentRoutesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus Routes")),
      body: ListView.builder(
        itemCount: 5, // Placeholder for route count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.route),
            title: Text('Route ${index + 1}'),
            subtitle: Text('Stop details and timings here'),
            onTap: () {
              // Show details for this route
            },
          );
        },
      ),
    );
  }
}

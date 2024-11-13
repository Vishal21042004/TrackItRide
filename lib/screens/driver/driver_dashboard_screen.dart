// lib/screens/driver/driver_dashboard_screen.dart

import 'package:flutter/material.dart';

class DriverDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Driver Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Start GPS tracking function
              },
              child: Text("Start Tracking"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Stop GPS tracking function
              },
              child: Text("Stop Tracking"),
            ),
          ],
        ),
      ),
    );
  }
}

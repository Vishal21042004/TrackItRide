// lib/screens/driver/driver_profile_screen.dart

import 'package:flutter/material.dart';

class DriverProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update profile details
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}

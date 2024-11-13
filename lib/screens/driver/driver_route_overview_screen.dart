// lib/screens/driver/driver_route_overview_screen.dart

import 'package:flutter/material.dart';

class DriverRouteOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assigned Route Overview")),
      body: ListView.builder(
        itemCount: 5,  // Placeholder for route stops
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.directions_bus),
            title: Text('Stop ${index + 1}'),
            subtitle: Text('Time: ${index + 1}:00 PM'),
          );
        },
      ),
    );
  }
}

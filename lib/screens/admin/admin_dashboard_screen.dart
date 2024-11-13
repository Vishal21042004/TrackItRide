// lib/screens/admin/admin_dashboard_screen.dart

import 'package:flutter/material.dart';
import 'admin_manage_buses_screen.dart';
import 'admin_manage_drivers_screen.dart';
import 'admin_route_management_screen.dart';
import 'admin_analytics_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.directions_bus),
            title: Text("Manage Buses"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManageBusesScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Manage Drivers"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManageDriversScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.route),
            title: Text("Manage Routes"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminRouteManagementScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text("Analytics"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminAnalyticsScreen()));
            },
          ),
        ],
      ),
    );
  }
}

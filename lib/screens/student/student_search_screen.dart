// lib/screens/student/student_search_screen.dart

import 'package:flutter/material.dart';

class StudentSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Buses")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search by Bus No. or Stop",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Placeholder for the number of search results
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.directions_bus),
                    title: Text('Bus ${index + 1}'),
                    subtitle: Text('Location: Stop ${index + 1}'),
                    onTap: () {
                      // Navigate to Location screen with bus info
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/screens/student/student_location_screen.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StudentLocationScreen extends StatefulWidget {
  @override
  _StudentLocationScreenState createState() => _StudentLocationScreenState();
}

class _StudentLocationScreenState extends State<StudentLocationScreen> {
  GoogleMapController? _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus Location")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(15.3647, 75.1240), // Placeholder location
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('busLocation'),
            position: LatLng(15.3647, 75.1240), // Replace with live data
            infoWindow: InfoWindow(title: 'Current Bus Location'),
          ),
        },
      ),
    );
  }
}

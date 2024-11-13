import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the firebase_options.dart file
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/student/student_home_screen.dart';
import 'screens/student/student_search_screen.dart';
import 'screens/student/student_location_screen.dart';
import 'screens/student/student_routes_screen.dart';
import 'screens/student/student_notifications_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrackItRide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route to Login
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/home': (context) => StudentHomeScreen(),
        '/search': (context) => StudentSearchScreen(),
        '/location': (context) => StudentLocationScreen(),
        '/routes': (context) => StudentRoutesScreen(),
        '/notifications': (context) => StudentNotificationsScreen(),
      },
    );
  }
}
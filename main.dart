
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/main_input_screen.dart';
import 'screens/image_created_screen.dart';

// Main entry point of the app
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Z AI Art',
      // Initial route is the login screen
      initialRoute: '/',
      // Define routes for different screens
      routes: {
        '/': (context) => LoginScreen(), // Login screen
        '/main': (context) => MainInputScreen(), // Main input screen
        '/image-created': (context) => ImageCreatedScreen(), // Image created screen
      },
    );
  }
}

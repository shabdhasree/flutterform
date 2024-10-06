import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & SignUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
       backgroundColor: const Color.fromARGB(255, 15, 128, 221), // AppBar background color globally
    ),
      ),
      home: LoginPage(),
    );
  }
}

// Dummy user data for demonstration
Map<String, String> users = {};

import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/forgot_password_screen.dart';
import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Screens/register_screen.dart';
import 'package:flutterapp/Screens/login_screen.dart';
import 'package:flutterapp/Screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/leave_form': (context) => HomeScreen(),
        '/forgot_password_screen': (context) => ForgotPasswordScreen(),
        '/profile_screen': (context) => ProfileScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:leaveapp/Screens/forgot_password_screen.dart';
import 'package:leaveapp/Screens/home_screen.dart';
import 'package:leaveapp/Screens/leave_submit_screen.dart';
import 'package:leaveapp/Screens/register_screen.dart';
import 'package:leaveapp/Screens/login_screen.dart';
import 'package:leaveapp/Screens/profile_screen.dart';
import 'package:leaveapp/Screens/users_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/leave_form': (context) => HomeScreen(),
        '/forgot_password_screen': (context) => ForgotPasswordScreen(),
        '/profile_screen': (context) => ProfileScreen(),
        '/leave_submit_screen': (context) => LeaveSubmitScreen(),
        '/users_list': (context) => UsersList()
      },
    );
  }
}

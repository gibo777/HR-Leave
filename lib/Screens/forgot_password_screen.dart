import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/globals.dart';

import 'login_screen.dart';

import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //   title: Text('Forgot Password'),
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () => Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => LoginScreen()),
        //     ),
        //   ),
        // ),
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('FORGOT PASSWORD',
                  style: TextStyle(
                    color: Color(0xff070540),
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          // color: Color(0xff206CCE),
          color: Color(0xff070540),
          size: 25,

          /// set the color of the AppBar buttons
        ),
        elevation: 0.0,
        toolbarHeight: kToolbarHeight * 1.3,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30.0),
              Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18.0),
              Text(
                'Enter the email associated with your account to change your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 15.0),
                      hintStyle: TextStyle(fontSize: 18.0),
                      // prefixIcon: Icon(Icons.email),
                    ),
                    onChanged: (value) {
                      _email = value;
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      // You can add additional validation logic here
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Center(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0747BF),
                        Color(0xff206cce),
                        Color(0xff0747BF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Color(0xffC1BABA),
                      width: 1,
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: 400,
                    child: Text(
                      'RESET PASSWORD',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // TODO: handle button press
                      // Navigator.pushReplacementNamed(context, '/leave_form');
                    },
                  ),
                ),
              ),
              // ElevatedButton(
              //   child: Text('Reset Password'),
              //   onPressed: () {
              //     // Code to reset password
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

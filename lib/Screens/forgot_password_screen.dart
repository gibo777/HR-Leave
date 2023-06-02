import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:leaveapp/Services/auth_services.dart';
import 'package:leaveapp/Services/globals.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_screen.dart';

import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  String _email = '';

  void sendResetEmail(BuildContext context, String email) async {
    final smtpServer = SmtpServer('smtp.gmail.com',
        username: 'kath.hrleave@gmail.com',
        password: 'jofjxhrlalpxicnu',
        port: 587);

    // final message = Message()
    //   ..from = Address('kath.hrleave@gmail.com', 'One Document Corporation')
    //   ..recipients.add(email)
    //   ..subject = 'Reset Password Notification'
    //   ..text = 'Instructions for resetting your password...';

    final resetUrl = 'https://example.com/reset-password'; // Replace with actual reset URL
    final emailBody = '''
Instructions for resetting your password:

Dear,

We have received a request to reset your password for your account at One Document Corporation.

Please click on the button below to reset your password:

''';

// Create a button that includes the reset URL
    final resetButton = TextButton(
      child: Text('Reset Password'),
      onPressed: () {
        launch(resetUrl); // Open the reset URL in a web browser
      },
    );

// Add the button to the plain text and HTML versions of the email
    final emailBodyWithButton = '$emailBody\n$resetUrl';
    final htmlBodyWithButton = '''
<!DOCTYPE html>
<html>
  <body>
    <p>Instructions for resetting your password:</p>
    <p>Dear ,</p>
    <p>We have received a request to reset your password for your account at One Document Corporation.</p>
    <p>Please click on the button below to reset your password:</p>
    <button><a href="https://example.com/reset-password">Reset Password</a></button>
    <p>If you did not request a password reset, please ignore this email and contact us immediately.</p>
    <p>Thank you,</p>
    <p>One Document Corporation</p>
  </body>
</html>
''';

// Set the text and HTML properties of the Message object
    final message = Message()
      ..from = Address('kath.hrleave@gmail.com', 'One Document Corporation')
      ..recipients.add(email)
      ..subject = 'Reset Password Notification'
      ..text = emailBodyWithButton
      ..html = htmlBodyWithButton;



    // final sendReport = await send(message, smtpServer);
    // print('Message sent: ${sendReport.toString()}');

    try {
      await send(message, smtpServer);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Email Sent'),
          content: Text(
              'Check your email for instructions on how to reset your password.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the "forgot password" functionality
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ));
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error sending email: $e');
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while sending the email.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
              // Image.asset(
              //   'assets/images/onedoc_logo.png',
              //   height: 80,
              // ),
              SizedBox(height: 30.0),
              Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18.0),
              Text(
                'No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.',
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
                    onPressed: () =>
                        sendResetEmail(context, _emailController.text),
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

import 'dart:convert';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:leaveapp/Services/auth_services.dart';
import 'package:leaveapp/Services/globals.dart';
import 'package:leaveapp/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  loginPressed() async {
    if (_email.isNotEmpty) {
      if (EmailValidator.validate(_email)) {
        if (_password.isNotEmpty) {
          http.Response response = await AuthServices.login(_email, _password);
          Map responseMap = jsonDecode(response.body);
          if (response.statusCode == 200) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const HomeScreen(),
              ),
            );
          } else {
            setState(() {
              _errorMessage = responseMap.values.first;
            });
          }
        } else {
          setState(() {
            _errorMessage = 'Enter your password';
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Invalid email format';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Enter your email';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Image.asset(
                    'assets/images/login_header.png',
                    height: 280,
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                              _errorMessage = ''; // Clear error message
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                              _errorMessage = ''; // Clear error message
                            });
                          },
                          obscureText: _obscureText,
                        ),
                      ),
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 45),
                  Center(
                    child: Container(
                      height: 40,
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
                            offset: Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Color(0xffC1BABA),
                          width: 1,
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: 330,
                        child: Text(
                          'LOG IN',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onPressed: loginPressed,
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                  Image.asset(
                    'assets/images/onedoc_logo.png',
                    height: 45,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
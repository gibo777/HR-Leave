import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:flutterapp/rounded_button.dart';
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

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Enter your email or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Container(
          // padding: EdgeInsets.all(16.0),
          color: Colors.white, // set the background color here
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    // Logo widget
                    Image.asset(
                      'assets/images/login_header.png',
                      height: 280,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.grey.shade400,
                        //     width: 1.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(8.0),
                        // ),
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              prefixIcon: Icon(Icons.person),
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
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.grey.shade400,
                        //     width: 1.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(8.0),
                        // ),
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              // border: InputBorder.none,
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
                              _password = value;
                            },
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter your password';
                              }
                              // You can add additional validation logic here
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              // TODO: Implement the "forgot password" functionality
                              Navigator.pushReplacementNamed(context, '/forgot_password_screen');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff6A6F77),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Color(0xffC1BABA),
                            width: 1,
                          ),
                        ),
                        child: MaterialButton(
                          minWidth: 280,
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
                          onPressed: ()
                              // TODO: handle button press
                              =>
                              loginPressed()
                          // Navigator.pushReplacementNamed(context, '/leave_form');
                          ,
                        ),
                      ),
                    ),
                    SizedBox(height: 120),
                    Image.asset(
                      'assets/images/onedoc_logo.png',
                      height: 45,
                    ),

                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    // ElevatedButton(
                    //   child: Text('Log in'),
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       // TODO: handle log in logic
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

// class _LoginScreenState extends State<LoginScreen> {
//   String _email = '';
//   String _password = '';
//
//   loginPressed() async {
//     if (_email.isNotEmpty && _password.isNotEmpty) {
//       http.Response response = await AuthServices.login(_email, _password);
//       Map responseMap = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => const HomeScreen(),
//             ));
//       } else {
//         errorSnackBar(context, responseMap.values.first);
//       }
//     } else {
//       errorSnackBar(context, 'enter all required fields');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           elevation: 0,
//           title: const Text(
//             'Login',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your email',
//                 ),
//                 onChanged: (value) {
//                   _email = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your password',
//                 ),
//                 onChanged: (value) {
//                   _password = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               RoundedButton(
//                 btnText: 'LOG IN',
//                 onBtnPressed: () => loginPressed(),
//               )
//             ],
//           ),
//         ));
//   }
// }

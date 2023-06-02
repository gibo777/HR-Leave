import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'side_bar.dart';
import 'dart:ui';

class LeaveSubmitScreen extends StatefulWidget {
  const LeaveSubmitScreen({Key? key}) : super(key: key);

  @override
  _LeaveSubmitScreenState createState() => _LeaveSubmitScreenState();
}

class _LeaveSubmitScreenState extends State<LeaveSubmitScreen> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('APPLICATION FOR',
                style: TextStyle(
                  color: Color(0xff070540),
                  fontWeight: FontWeight.bold,
                )),
            Text('LEAVE OF ABSENCE',
                style: TextStyle(
                  color: Color(0xff070540),
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          // color: Color(0xff206CCE),
          color: Color(0xff070540),
          size: 35,

          /// set the color of the AppBar buttons
        ),
        elevation: 0.0,
        toolbarHeight: kToolbarHeight * 1.3,
      ),
      drawer: SideBar(),
      body: Center(
        child: Container(
          // width: screenWidth * 10,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30.0),
                Image.asset(
                  'assets/images/success.png',
                  height: 220,
                ),
                SizedBox(height: 18.0),
                Text(
                  'Leave form',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'successfully submitted!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40.0),
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
                      minWidth: 120,
                      child: Text(
                        'OK',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/leave_form')
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

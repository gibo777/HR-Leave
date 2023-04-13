import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'side_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    // Implement logout action here
    // For example, you can clear the user token or credentials
    // and navigate to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'APPLICATION FOR LEAVE OF ABSENCE',
      //     style: TextStyle(color: Color(0xff070540)),
      //   ),
      appBar: AppBar(
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('PERSONAL DATA',
                  style: TextStyle(
                    color: Color(0xff070540),
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
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
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Welcome to the profile page!'),
        ),
      ),
    );
  }
}
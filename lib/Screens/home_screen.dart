import 'package:flutter/material.dart';
import 'side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'APPLICATION FOR LEAVE OF ABSENCE',
      //     style: TextStyle(color: Color(0xff070540)),
      //   ),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('APPLICATION FOR',
                style: TextStyle(color: Color(0xff070540),
                  fontWeight: FontWeight.bold,)),
            Text('LEAVE OF ABSENCE',
                style: TextStyle(color: Color(0xff070540),
                  fontWeight: FontWeight.bold,)),
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
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Welcome to the home page!'),
        ),
      ),
    );
  }
}
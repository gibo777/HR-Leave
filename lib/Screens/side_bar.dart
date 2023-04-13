import 'package:flutter/material.dart';
import 'login_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

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
    // drawer: Drawer(
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: <Widget>[
    //       DrawerHeader(
    //         child:
    //         // Text('Sidebar'),
    //         Image.asset(
    //           'assets/images/onedoc_logo.png',
    //           // height: 20,
    //           // width: 20,
    //         ),
    //         // decoration: BoxDecoration(
    //         //   color: Colors.blue,
    //         // ),
    //       ),
    //       ListTile(
    //         leading:
    //         Icon(Icons.description_outlined, color: Color(0xff374151)),
    //         title: Text('E-leave Form',
    //             style: TextStyle(color: Color(0xff374151))),
    //         onTap: () {
    //           Navigator.pop(context, '/leave_form');
    //         },
    //       ),
    //       ListTile(
    //         leading:
    //         Icon(Icons.format_list_bulleted, color: Color(0xff374151)),
    //         title: Text('List of Leaves',
    //             style: TextStyle(color: Color(0xff374151))),
    //         onTap: () {
    //           // Handle tap on Settings
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.logout, color: Color(0xff374151)),
    //         title: Text('Logout', style: TextStyle(color: Color(0xff374151))),
    //         onTap: () {
    //           _logout(context);
    //         },
    //       ),
    //     ],
    //   ),
    // ),
    // drawer: Drawer(
    //   child: Column(
    //     children: [
    //       DrawerHeader(
    //         child: Image.asset(
    //           'assets/images/onedoc_logo.png',
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView(
    //           padding: EdgeInsets.zero,
    //           children: [
    //             ListTile(
    //               leading: Icon(Icons.description_outlined, color: Color(0xff374151)),
    //               title: Text('E-leave Form', style: TextStyle(color: Color(0xff374151))),
    //               onTap: () {
    //                 Navigator.pop(context, '/leave_form');
    //               },
    //             ),
    //             ListTile(
    //               leading: Icon(Icons.format_list_bulleted, color: Color(0xff374151)),
    //               title: Text('List of Leaves', style: TextStyle(color: Color(0xff374151))),
    //               onTap: () {
    //                 // Handle tap on List of Leaves
    //               },
    //             ),
    //             ListTile(
    //               leading: Icon(Icons.logout, color: Color(0xff374151)),
    //               title: Text('Logout', style: TextStyle(color: Color(0xff374151))),
    //               onTap: () {
    //                 _logout(context);
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //       Visibility(
    //         visible: false,
    //         child: Divider(),
    //       ),
    //       Container(
    //         height: 70,
    //         decoration: BoxDecoration(
    //           color: Color(0xfff0f0f0), // replace with desired color
    //         ),
    //         child: Center(
    //           child: ListTile(
    //             leading: Icon(Icons.person, color: Color(0xff374151)),
    //             title: Text('Profile', style: TextStyle(color: Color(0xff374151))),
    //             onTap: () {
    //               // Handle tap on Profile
    //               Navigator.pushReplacementNamed(context, '/profile_screen');
    //             },
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    //
    // return Drawer(
    //   child: Column(
    //     children: [
    //       DrawerHeader(
    //         child: Image.asset(
    //           'assets/images/onedoc_logo.png',
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView(
    //           padding: EdgeInsets.zero,
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 Navigator.pushReplacementNamed(context, '/leave_form');
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.description_outlined, color: Color(0xff374151)),
    //                 title: Text('E-leave Form', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 // Handle tap on List of Leaves
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.format_list_bulleted, color: Color(0xff374151)),
    //                 title: Text('List of Leaves', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 _logout(context);
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.logout, color: Color(0xff374151)),
    //                 title: Text('Logout', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Visibility(
    //         visible: false,
    //         child: Divider(),
    //       ),
    //       Container(
    //         height: 70,
    //         decoration: BoxDecoration(
    //           color: Color(0xfff0f0f0), // replace with desired color
    //         ),
    //         child: Center(
    //           child: InkWell(
    //             onTap: () {
    //               Navigator.pushReplacementNamed(context, '/profile_screen');
    //             },
    //             splashColor: Colors.black.withOpacity(1),
    //             highlightColor: Colors.blue.withOpacity(0.2),
    //             child: ListTile(
    //               leading: Icon(Icons.person, color: Color(0xff374151)),
    //               title: Text('Profile', style: TextStyle(color: Color(0xff374151))),
    //             ),
    //           ),
    //         ),
    //       ),
    //       // InkWell(
    //       //   onTap: () {
    //       //     // Handle tap on widget
    //       //   Navigator.pushReplacementNamed(context, '/profile_screen');
    //       //   },
    //       //   splashColor: Colors.blue.withOpacity(0.5),
    //       //   highlightColor: Colors.blue.withOpacity(0.2),
    //       //   child: Container(
    //       //     height: 70,
    //       //     decoration: BoxDecoration(
    //       //       // color: Color(0xfff0f0f0), // replace with desired color
    //       //     ),
    //       //     child: Center(
    //       //         child: ListTile(
    //       //           leading: Icon(Icons.person, color: Color(0xff374151)),
    //       //           title: Text('Profile', style: TextStyle(color: Color(0xff374151))),
    //       //         ),
    //       //       ),
    //       //     ),
    //       //   ),
    //     ],
    //   ),
    // );

    // return Drawer(
    //   child: Column(
    //     children: [
    //       DrawerHeader(
    //         child: Image.asset(
    //           'assets/images/onedoc_logo.png',
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView(
    //           padding: EdgeInsets.zero,
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 Navigator.pushReplacementNamed(context, '/leave_form');
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.description_outlined, color: Color(0xff374151)),
    //                 title: Text('E-leave Form', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 // Handle tap on List of Leaves
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.format_list_bulleted, color: Color(0xff374151)),
    //                 title: Text('List of Leaves', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //             Visibility(
    //               visible: false,
    //               child: Divider(),
    //             ),
    //             // InkWell(
    //             //   onTap: () {
    //             //     Navigator.pushReplacementNamed(context, '/profile_screen');
    //             //   },
    //             //   splashColor: Colors.black.withOpacity(1),
    //             //   highlightColor: Colors.blue.withOpacity(0.2),
    //              Container(
    //                 height: 70,
    //                 decoration: BoxDecoration(
    //                   color: Color(0xfff0f0f0), // replace with desired color
    //                   // border: Border(
    //                   //   top: BorderSide(color: Colors.grey.withOpacity(0.5)),
    //                   //   bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
    //                   // ),
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 16),
    //                       child: Row(
    //                         children: [
    //                           Icon(Icons.person, color: Color(0xff374151)),
    //                           SizedBox(width: 16),
    //                           Text('Profile', style: TextStyle(color: Color(0xff374151))),
    //                         ],
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(right: 16),
    //                       child: InkWell(
    //                         onTap: () {
    //                           _logout(context);
    //                         },
    //                         splashColor: Colors.blue.withOpacity(0.5),
    //                         highlightColor: Colors.blue.withOpacity(0.2),
    //                         child: Row(
    //                           children: [
    //                             // Text('Logout', style: TextStyle(color: Color(0xff374151))),
    //                             SizedBox(width: 16),
    //                             Icon(Icons.logout, color: Color(0xff374151)),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // return Drawer(
    //   child: Column(
    //     children: [
    //       DrawerHeader(
    //         child: Image.asset(
    //           'assets/images/onedoc_logo.png',
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView(
    //           padding: EdgeInsets.zero,
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 Navigator.pushReplacementNamed(context, '/leave_form');
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.description_outlined, color: Color(0xff374151)),
    //                 title: Text('E-leave Form', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 // Handle tap on List of Leaves
    //               },
    //               splashColor: Colors.blue.withOpacity(0.5),
    //               highlightColor: Colors.blue.withOpacity(0.2),
    //               child: ListTile(
    //                 leading: Icon(Icons.format_list_bulleted, color: Color(0xff374151)),
    //                 title: Text('List of Leaves', style: TextStyle(color: Color(0xff374151))),
    //               ),
    //             ),
    //             Visibility(
    //               visible: false,
    //               child: Divider(),
    //             ),
    //             Spacer(), // Add a spacer to push the profile section to the bottom
    //             Container(
    //               height: 70,
    //               decoration: BoxDecoration(
    //                 color: Color(0xfff0f0f0), // replace with desired color
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 16),
    //                     child: Row(
    //                       children: [
    //                         Icon(Icons.person, color: Color(0xff374151)),
    //                         SizedBox(width: 16),
    //                         Text('Profile', style: TextStyle(color: Color(0xff374151))),
    //                       ],
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 16),
    //                     child: InkWell(
    //                       onTap: () {
    //                         _logout(context);
    //                       },
    //                       splashColor: Colors.blue.withOpacity(0.5),
    //                       highlightColor: Colors.blue.withOpacity(0.2),
    //                       child: Row(
    //                         children: [
    //                           SizedBox(width: 16),
    //                           Icon(Icons.logout, color: Color(0xff374151)),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/onedoc_logo.png',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/leave_form');
            },
            leading: Icon(Icons.description_outlined, color: Color(0xff374151)),
            title: Text('E-leave Form',
                style: TextStyle(color: Color(0xff374151))),
          ),
          ListTile(
            onTap: () {
              // Handle tap on List of Leaves
            },
            leading: Icon(Icons.format_list_bulleted, color: Color(0xff374151)),
            title: Text('List of Leaves',
                style: TextStyle(color: Color(0xff374151))),
          ),
          Visibility(
            visible: false,
            child: Divider(),
          ),
          Spacer(), // Add a spacer to push the profile section to the bottom
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xffd9d9d9), // replace with desired color
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/profile_screen');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Icon(Icons.person, color: Color(0xff374151)),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  color: Color(0xff374151),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                         Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'example@gmail.com', // replace with your desired subtitle
                              style: TextStyle(
                                color: Color(0xff374151),
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        // ),
                      ],
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      _logout(context);
                    },
                    child: Row(
                      children: [
                        // SizedBox(width: 16),
                        Icon(Icons.logout, color: Color(0xff374151)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'side_bar.dart';
import 'dart:ui';

import 'package:leaveapp/Services/auth_services.dart';
import 'package:leaveapp/Services/globals.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedDept = '';
  bool _dateSelected = false;
  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _reasonController = TextEditingController();

  void _onDaySelected(DateTime selectedDate, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDate;
    });
    Navigator.pop(context);
  }

  String _reason = '';

  createLeavePressed() async {
      http.Response response =
      await AuthServices.leave( _reason);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
      // body: Padding(
      // padding: EdgeInsets.all(18.0),
      // child: Container(
      //   height: 90,
      //   child: Card(
      //     color: Color(0xffF6F6FF),
      //     elevation: 4.0,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(8.0),
      //       side: BorderSide(color: Colors.grey, width: 1.0),
      //     ),
      //     margin: EdgeInsets.all(10.0),
      //     child: Padding(
      //       padding: EdgeInsets.all(12.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Name'.toUpperCase(),
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 15.0,
      //               color: Colors.black,
      //             ),
      //           ),
      //           SizedBox(height: 6.0),
      //           Row(
      //             children: [
      //               Expanded(
      //                 child: Text(
      //                   'Dela Cruz, Juan S.'.toUpperCase(), //get name from db
      //                   style: TextStyle(
      //                     fontSize: 18.0,
      //                     color: Colors.grey[600],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // child: Container(
      //       height: 90,
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: Card(
      //             color: Color(0xffF6F6FF),
      //             elevation: 4.0,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(8.0),
      //               side: BorderSide(color: Colors.grey, width: 1.0),
      //             ),
      //             margin: EdgeInsets.all(10.0),
      //             child: Padding(
      //               padding: EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Title 1'.toUpperCase(),
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15.0,
      //                       color: Colors.black,
      //                     ),
      //                   ),
      //                   Text(
      //                     'Subtitle 1',
      //                     style: TextStyle(
      //                       fontSize: 12.0,
      //                       color: Colors.grey[600],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Card(
      //             color: Color(0xffF6F6FF),
      //             elevation: 4.0,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(8.0),
      //               side: BorderSide(color: Colors.grey, width: 1.0),
      //             ),
      //             margin: EdgeInsets.all(10.0),
      //             child: Padding(
      //               padding: EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             'Title 2'.toUpperCase(),
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15.0,
      //                               color: Colors.black,
      //                             ),
      //                           ),
      //                           Text(
      //                             'Subtitle 2',
      //                             style: TextStyle(
      //                               fontSize: 12.0,
      //                               color: Colors.grey[600],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth * 10,
                child: Flexible(
                  child: Card(
                    color: Color(0xffF6F6FF),
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name'.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Dela Cruz, Juan S.'.toUpperCase(),
                                  //get name from db
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 10,
                child: Row(
                  children: [
                    Flexible(
                      child: Card(
                        color: Color(0xffF6F6FF),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        margin: EdgeInsets.only(
                            top: 5.0, left: 10.0, right: 5.0, bottom: 5.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Employee Number'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      '1111-1111',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Card(
                        color: Color(0xffF6F6FF),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        margin: EdgeInsets.only(
                            top: 5.0, left: 5.0, right: 10.0, bottom: 5.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date Applied'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      '03/17/2023',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 10,
                child: Flexible(
                  child: Card(
                    color: Color(0xffF6F6FF),
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Department'.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  '1D-HR'.toUpperCase(),
                                  //get name from db
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 90,
              //   child: Card(
              //     color: Color(0xffF6F6FF),
              //     elevation: 3.0,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //       side: BorderSide(color: Colors.grey, width: 1.0),
              //     ),
              //     margin: EdgeInsets.all(10.0),
              //     child: Padding(
              //       padding: EdgeInsets.all(12.0),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Name'.toUpperCase(),
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15.0,
              //               color: Colors.black,
              //             ),
              //           ),
              //           SizedBox(height: 2.0),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: SizedBox(
              //                   height: 25.0,
              //                 child: DropdownButton<String>(
              //                   value: _selectedDept,
              //                   onChanged: (String? newDept) {
              //                     setState(() {
              //                       _selectedDept = newDept as String;
              //                     });
              //                   },
              //                   items: <String>[
              //                     'HR - HR/Admin',
              //                     'IT - IT Department',
              //                     'ACCT - Accounting',
              //                   ].map<DropdownMenuItem<String>>((String value) {
              //                     return DropdownMenuItem<String>(
              //                       value: value,
              //                       child: Text(value.toUpperCase(),
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: TextStyle(
              //                         fontSize: 18.0,
              //                         color: Colors.grey[600],
              //                       ),
              //                       ));
              //                   }).toList(),
              //                 )
              //                 )
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: TableCalendar(
                                firstDay: DateTime(2021),
                                lastDay: DateTime(2025),
                                focusedDay: _selectedDate,
                                calendarFormat: CalendarFormat.month,
                                selectedDayPredicate: (day) {
                                  return isSameDay(_selectedDate, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  _onDaySelected(selectedDay, focusedDay);
                                  setState(() {
                                    _dateSelected = true;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                        child: Flexible(
                          child: Card(
                            color: Color(0xffFfFfFF),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            margin: EdgeInsets.only(
                                top: 5.0, left: 10.0, right: 5.0, bottom: 5.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 10.0,
                                  bottom: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Begin'.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // SizedBox(height: 6.0),
                                  // Container(
                                  //   width: 100,
                                  //   child: Row(
                                  //     children: [
                                  //       // Flexible(
                                  //       //   child: Text(
                                  //       //     DateFormat('MM/dd/yy')
                                  //       //         .format(_selectedDate),
                                  //       //     style: TextStyle(
                                  //       //       fontSize: 15.0,
                                  //       //       color: Colors.grey[600],
                                  //       //     ),
                                  //       //   ),
                                  //       // ),
                                  //       // _dateSelected
                                  //       //     ? SizedBox.shrink()
                                  //       //     : Icon(
                                  //       //         Icons.calendar_month_outlined,
                                  //       //         size: 15,
                                  //       //         color: Colors.grey,
                                  //       //       ),
                                  //       Flexible(
                                  //         // flex: 1,
                                  //         child: TextField(
                                  //           readOnly: true,
                                  //           decoration: InputDecoration(
                                  //             // labelText: 'Date',
                                  //             // border: OutlineInputBorder(
                                  //             //   borderRadius:
                                  //             //   BorderRadius.all(Radius.circular(10.0)),
                                  //             // ),
                                  //             suffixIcon: Icon(Icons.calendar_month_outlined,
                                  //                       size: 15,
                                  //                       color: Colors.grey,
                                  //             ),
                                  //           ),
                                  //           style: TextStyle(
                                  //             fontSize: 15.0,
                                  //             color: Colors.grey[600],
                                  //           ),
                                  //           controller: _dateController, // set the controller for the text field
                                  //           onTap: () async {
                                  //             final DateTime? selectedDate = await showDatePicker(
                                  //               context: context,
                                  //               initialDate: DateTime.now(),
                                  //               firstDate: DateTime(1900),
                                  //               lastDate: DateTime(2100),
                                  //             );
                                  //             if (selectedDate != null) {
                                  //               // update the value of the text field with the selected date
                                  //               String formattedDate =
                                  //               DateFormat('MM/dd/yyyy').format(selectedDate);
                                  //               _dateController.text = formattedDate;
                                  //             }
                                  //           },
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 40,
                                  //   child: Row(
                                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                                  //     children: [
                                  //       Expanded(
                                  //         child: TextField(
                                  //           readOnly: true,
                                  //           decoration: InputDecoration(
                                  //             suffixIcon: Padding(
                                  //               padding: EdgeInsets.only(right: 0.0), // Adjust the padding as needed
                                  //               child: Icon(
                                  //                 Icons.calendar_month_outlined,
                                  //                 size: 15,
                                  //                 color: Colors.grey,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           style: TextStyle(
                                  //             fontSize: 15.0,
                                  //             color: Colors.grey[600],
                                  //           ),
                                  //           controller: _dateController,
                                  //           onTap: () async {
                                  //             final DateTime? selectedDate = await showDatePicker(
                                  //               context: context,
                                  //               initialDate: DateTime.now(),
                                  //               firstDate: DateTime(1900),
                                  //               lastDate: DateTime(2100),
                                  //             );
                                  //             if (selectedDate != null) {
                                  //               String formattedDate = DateFormat('MM/dd/yyyy').format(selectedDate);
                                  //               _dateController.text = formattedDate;
                                  //             }
                                  //           },
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Container(
                                    height: 41,
                                    width: 160,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 0.0), // Adjust the margin as needed
                                            child: TextField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                suffixIcon: _dateController.text.isEmpty
                                                    ? SizedBox.shrink()
                                                    : Padding(
                                                  padding: EdgeInsets.only(right: 0.0), // Adjust the margin as needed
                                                  child: Icon(
                                                  Icons.calendar_month_outlined,
                                                  size: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              ),
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey[600],
                                              ),
                                              controller: _dateController,
                                              onTap: () async {
                                                final DateTime? selectedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2100),
                                                );
                                                if (selectedDate != null) {
                                                  String formattedDate = DateFormat('MM/dd/yy').format(selectedDate);
                                                  _dateController.text = formattedDate;
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (context) => AlertDialog(
                    //           content: TableCalendar(
                    //             firstDay: DateTime(2021),
                    //             lastDay: DateTime(2025),
                    //             focusedDay: _selectedDate,
                    //             calendarFormat: CalendarFormat.month,
                    //             selectedDayPredicate: (day) {
                    //               return isSameDay(_selectedDate, day);
                    //             },
                    //             onDaySelected: (selectedDay, focusedDay) {
                    //               _onDaySelected(selectedDay, focusedDay);
                    //               setState(() {
                    //                 _dateSelected = true;
                    //               });
                    //               Navigator.pop(context);
                    //             },
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     child: Flexible(
                    //       child: Card(
                    //         color: Color(0xffFfFfFF),
                    //         elevation: 2.0,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8.0),
                    //           side: BorderSide(color: Colors.grey, width: 1.0),
                    //         ),
                    //         margin: EdgeInsets.only(
                    //             top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                    //         child: Padding(
                    //           padding: EdgeInsets.all(12.0),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'End'.toUpperCase(),
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 13.0,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 6.0),
                    //               Container(
                    //                 width: 100,
                    //                 child: Row(
                    //                   children: [
                    //                     Flexible(
                    //                       child: Text(
                    //                         DateFormat('MM/dd/yy')
                    //                             .format(_selectedDate),
                    //                         style: TextStyle(
                    //                           fontSize: 15.0,
                    //                           color: Colors.grey[600],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     _dateSelected
                    //                         ? SizedBox.shrink()
                    //                         : Icon(
                    //                             Icons.calendar_month_outlined,
                    //                             size: 15,
                    //                             color: Colors.grey,
                    //                           ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2025),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              _dateController.text = DateFormat('MM/dd/yyyy').format(selectedDate);
                            });
                          }
                        },
                        child: Flexible(
                          child: Card(
                            color: Color(0xffFfFfFF),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            margin: EdgeInsets.only(
                                top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'End'.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextField(
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              hintText: 'MM/dd/yyyy',
                                              border: InputBorder.none,
                                            ),
                                            controller: _dateController,
                                          ),
                                        ),
                                        Icon(
                                          Icons.calendar_today,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Flexible(
                      child: Card(
                        color: Color(0xffF6F6FF),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        margin: EdgeInsets.only(
                            top: 5.0, left: 5.0, right: 10.0, bottom: 5.0),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 12.0, left: 12.0, right: 12.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  'No. of Days'.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Card(
                  color: Color(0xffFfffFF),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Reason'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(height: 2.0),
                        AutoSizeTextField(
                          controller: _reasonController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter reason',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _reason = value;
                          },
                          // validator: (value) {
                          //   if (value?.isEmpty ?? true) {
                          //     return 'Please enter your reason';
                          //   }
                          //   // You can add additional validation logic here
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 10,
                child: Flexible(
                  child: Card(
                    color: Color(0xffF6F6FF),
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      // side: BorderSide(color: Colors.grey, width: 1.0),
                    ), // set the elevation value as per your requirement
                    margin: EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder(
                        horizontalInside: BorderSide(color: Color(0xffC1BABA)),
                        verticalInside: BorderSide(color: Color(0xffC1BABA)),
                        top: BorderSide(color: Color(0xffC1BABA)),
                        bottom: BorderSide(color: Color(0xffC1BABA)),
                        left: BorderSide(color: Color(0xffC1BABA)),
                        right: BorderSide(color: Color(0xffC1BABA)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      children: [
                        TableRow(
                          children: [
                            Container(
                              width: screenWidth * 10,
                              child: TableCell(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'VL',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'SL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'EL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'ML/PL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Flexible(
                                    child: Text(
                                      'Other'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width: screenWidth * 10,
                              child: TableCell(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 10,
                              child: TableCell(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 10,
                              child: TableCell(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 10,
                              child: TableCell(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 10,
                              child: TableCell(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Table(
              //   border: TableBorder.all(color: Color(0xffC1BABA)),
              //   children: [
              //     TableRow(
              //       children: [
              //         TableCell(
              //           child: Center(
              //             child: Text('Merged Cell'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //         TableCell(
              //           child: Center(
              //             child: Text('Column 2'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //       ],
              //     ),
              //     TableRow(
              //       children: [
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 2, Column 1'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 2, Column 2'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //       ],
              //     ),
              //     TableRow(
              //       children: [
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 3, Column 1'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 3, Column 2'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //       ],
              //     ),
              //     TableRow(
              //       children: [
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 4, Column 1'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 4, Column 2'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //       ],
              //     ),
              //     TableRow(
              //       children: [
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 5, Column 1'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //         TableCell(
              //           child: Center(
              //             child: Text('Row 5, Column 2'),
              //           ),
              //           verticalAlignment: TableCellVerticalAlignment.middle,
              //         ),
              //       ],
              //     ),
              //   ],
              // )
              //     Container(
              //   margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
              //   child: Table(
              //     border: TableBorder(
              //       horizontalInside: BorderSide(color: Color(0xffC1BABA)),
              //       verticalInside: BorderSide(color: Color(0xffC1BABA)),
              //       top: BorderSide(color: Color(0xffC1BABA)),
              //       bottom: BorderSide(color: Color(0xffC1BABA)),
              //       left: BorderSide(color: Color(0xffC1BABA)),
              //       right: BorderSide(color: Color(0xffC1BABA)),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     children: [
              //       TableRow(
              //         children: [
              //           TableCell(
              //             child: Center(
              //               child: Text('Merged Cell'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //           TableCell(
              //             child: Center(
              //               child: Text('Column 2'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //         ],
              //       ),
              //       TableRow(
              //         children: [
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 2, Column 1'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 2, Column 2'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //         ],
              //       ),
              //       TableRow(
              //         children: [
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 3, Column 1'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 3, Column 2'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //         ],
              //       ),
              //       TableRow(
              //         children: [
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 4, Column 1'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 4, Column 2'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //         ],
              //       ),
              //       TableRow(
              //         children: [
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 5, Column 1'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //           TableCell(
              //             child: Center(
              //               child: Text('Row 5, Column 2'),
              //             ),
              //             verticalAlignment: TableCellVerticalAlignment.middle,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                width: screenWidth * 10,
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    // side: BorderSide(color: Colors.grey, width: 1.0),
                  ), // set the elevation value as per your requirement
                  margin: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder(
                      horizontalInside: BorderSide(color: Color(0xffC1BABA)),
                      verticalInside: BorderSide(color: Color(0xffC1BABA)),
                      top: BorderSide(color: Color(0xffC1BABA)),
                      bottom: BorderSide(color: Color(0xffC1BABA)),
                      left: BorderSide(color: Color(0xffC1BABA)),
                      right: BorderSide(color: Color(0xffC1BABA)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 8.0),
                                  child: Text(
                                    'Status'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(''),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 8.0),
                                  child: Text(
                                    'Available'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 8.0),
                                  child: Text(
                                    'Taken'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 8.0),
                                  child: Text(
                                    'Balance'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 8.0),
                                  child: Text(
                                    'As of:'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * 10,
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  '05/02/2023',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: SizedBox(
              //     width: 350, // set the width here
              //     child: DataTable(
              //       columns: [
              //         DataColumn(label: Text('')),
              //         DataColumn(label: Text('')),
              //       ],
              //       rows: [
              //         DataRow(cells: [
              //           DataCell(
              //             Text('Status'),
              //             placeholder: false,
              //             showEditIcon: false,
              //             onTap: () {},
              //           ),
              //           DataCell(
              //             Container(),
              //             placeholder: false,
              //             showEditIcon: false,
              //             onTap: () {},
              //           ),
              //         ]),
              //         DataRow(cells: [
              //           DataCell(Text('John')),
              //           DataCell(Text('28')),
              //         ]),
              //         DataRow(cells: [
              //           DataCell(Text('Jane')),
              //           DataCell(Text('32')),
              //         ]),
              //         DataRow(cells: [
              //           DataCell(Text('Mary')),
              //           DataCell(Text('24')),
              //         ]),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Instructions:'.toUpperCase(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 5.0, left: 16.0, right: 15.0, bottom: 5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '1. Application for leave of absence must be filed at the latest, '
                        'three (3) working days prior to the date of leave. In case of emergency, '
                        'it must be filed immediately upon reporting for work.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '2. Application for sick leave of more than two (2) consecutive days must be '
                        'supported by a medical certificate.',
                        style: TextStyle(
                          fontSize: 14,
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
                      'Submit Leave Form'.toUpperCase(),
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
                        // loginPressed()
                    Navigator.pushReplacementNamed(context, '/leave_submit_screen')
                    ,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

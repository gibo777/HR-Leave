import 'dart:convert';

import 'package:leaveapp/data/users_api.dart';
import 'package:leaveapp/model/users.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<Users> userList = <Users>[];

  void getUsersfromApi() async {
    UsersApi.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        userList = list.map((model) => Users.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUsersfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Leave App Users"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userList[index].last_name),
                  subtitle: Text(userList[index].first_name),
                );
              }),
        ));
  }
}
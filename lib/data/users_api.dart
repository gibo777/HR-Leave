import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:leaveapp/Services/globals.dart';

class UsersApi {
  static Future getUsers() {
    return http.get('http://192.168.1.157/getemployees' as Uri);
  }
}
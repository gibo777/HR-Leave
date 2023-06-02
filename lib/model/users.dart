class Users {
  int id;
  String last_name;
  String first_name;
  String role_type;
  String department;

  Users.fromJson(Map json)
      : id = json['id'],
        last_name = json['last_name'],
        first_name = json['first_name'],
        role_type = json['role_type'],
        department = json['department'];

  Map toJson() {
    return {'id': id, 'last_name': last_name, 'first_name': first_name, 'role_type': role_type, 'department': department};
  }
}
import 'package:flutter/material.dart';

import 'package:state_management/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User get user => this._user!;
  bool get userExists => this._user != null;

  void set loadUser(User user) {
    this._user = user;
    notifyListeners();
  }

  void set userAge(int age) {
    this._user?.age = age;
    notifyListeners();
  }

  void logOut() {
    this._user = null;
    notifyListeners();
  }

  void addProfession() {
    this._user?.professions.add('Profession ${user.professions.length}');
    notifyListeners();
  }
}

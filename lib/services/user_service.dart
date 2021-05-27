import 'dart:async';

import 'package:state_management/models/user.dart';

class _UserService {
  User? _user;

  StreamController<User> _userStreamController = StreamController<User>.broadcast();

  User? get user => this._user;
  bool get userExists => this._user != null;

  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user) {
    this._user = user;
    this._userStreamController.add(user);
  }

  void changeAge(int age) {
    this._user?.age = age;
    this._userStreamController.add(this._user!);
  }

  dispose() {
    this._userStreamController.close();
  }
}

final userService = _UserService();

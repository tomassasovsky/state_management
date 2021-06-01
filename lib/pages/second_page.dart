import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:state_management/controllers/user_controller.dart';
import 'package:state_management/models/user.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Set User', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final user = User(name: 'Tomás', age: 18, professions: ['']);
                userController.loadUser(user);
                Get.snackbar(
                  'User Loaded',
                  'Tomás is the new User',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(color: Colors.black38, blurRadius: 10),
                  ],
                );
              },
            ),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userController.changeAge(30);
              },
            ),
            MaterialButton(
              child: Text('Add Profession', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userController.addProfession('Profession ${userController.professionsLength + 1}');
              },
            ),
            MaterialButton(
              child: Text('Change Theme', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
            ),
          ],
        ),
      ),
    );
  }
}

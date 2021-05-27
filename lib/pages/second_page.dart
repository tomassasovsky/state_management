import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/user.dart';
import 'package:state_management/services/user_service.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: userService.userExists ? Text('${userService.user.name}') : Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Set User', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final user = User(name: 'Tomás', professions: ['Full Stack Dev', 'Flutter Dev']);
                Provider.of<UserService>(context, listen: false).loadUser = user;
              },
            ),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Provider.of<UserService>(context, listen: false).userAge = 20;
              },
            ),
            MaterialButton(
              child: Text('Add Profession', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Provider.of<UserService>(context, listen: false).addProfession();
              },
            ),
          ],
        ),
      ),
    );
  }
}

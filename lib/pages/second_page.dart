import 'package:flutter/material.dart';
import 'package:state_management/models/user.dart';
import 'package:state_management/services/user_service.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _Name(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Set User', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final user = User(name: 'Tomás', age: 18, professions: []);
                userService.loadUser(user);
              },
            ),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userService.changeAge(19);
              },
            ),
            MaterialButton(
              child: Text('Add Profession', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: userService.userStream,
      builder: (context, AsyncSnapshot<User> snapshot) {
        return snapshot.hasData ? Text('${snapshot.data!.name}') : Text('Second Page');
      },
    );
  }
}

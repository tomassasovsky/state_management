import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:state_management/models/user.dart';

import 'package:state_management/services/user_service.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<UserService>(context, listen: false).logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: userService.userExists
          ? UserData(user: userService.user)
          : Center(
              child: Text('No User Data'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'second'),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          Text('Professions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...user.professions.map((profession) => ListTile(title: Text(profession))).toList(),
          // ListTile(title: Text('Profession 1: ')),
        ],
      ),
    );
  }
}

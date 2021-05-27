import 'package:flutter/material.dart';
import 'package:state_management/models/user.dart';
import 'package:state_management/services/user_service.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: StreamBuilder<User>(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? UserData(user: snapshot.data!)
                : Center(
                    child: Text('No User Data'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'second'),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  final User user;
  const UserData({Key? key, required this.user}) : super(key: key);

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
          ListTile(title: Text('Profession 1: ')),
          ListTile(title: Text('Profession 2: ')),
        ],
      ),
    );
  }
}

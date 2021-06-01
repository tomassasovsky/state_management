import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/controllers/user_controller.dart';
import 'package:state_management/models/user.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Obx(
        () => userController.userExists.value ? UserData(user: userController.user!.value) : NoData(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed('second', arguments: {
          'name': 'Tomás',
          'age': 35,
        }),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No User Data'),
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
          ListTile(title: Text('Name: ${this.user.name}')),
          ListTile(title: Text('Age: ${this.user.age}')),
          Text('Professions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...user.professions.map((profession) => ListTile(title: Text(profession))),
        ],
      ),
    );
  }
}

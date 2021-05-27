import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_management/bloc/user/user_cubit.dart';
import 'package:state_management/models/user.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => BlocProvider.of<UserCubit>(context).logOut(),
          ),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'second'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, state) {
        switch (state.runtimeType) {
          case InitialUserState:
            return Center(child: Text('No User Data'));
          case CurrentUser:
            return UserData((state as CurrentUser).user);
          default:
            return Center(child: Text('State hasn\'t been recognized'));
        }
      },
    );
  }
}

class UserData extends StatelessWidget {
  final User user;

  const UserData(this.user, {Key? key}) : super(key: key);

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
          ...user.professions.map((profession) => ListTile(title: Text(profession))),
        ],
      ),
    );
  }
}

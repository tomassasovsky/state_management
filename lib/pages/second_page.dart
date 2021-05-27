import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/user/user_cubit.dart';
import 'package:state_management/models/user.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is InitialUserState) {
              return Text('Second Page');
            } else {
              // final name = BlocProvider.of<UserCubit>(context);
              return Text('asfdas');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Set User', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final user = User(name: 'Tomás', professions: ['Flutter', 'Dev']);
                BlocProvider.of<UserCubit>(context, listen: false).selectUser(user);
              },
            ),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<UserCubit>(context, listen: false).changeAge(30);
              },
            ),
            MaterialButton(
              child: Text('Add Profession', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<UserCubit>(context, listen: false).addProfession();
              },
            ),
          ],
        ),
      ),
    );
  }
}

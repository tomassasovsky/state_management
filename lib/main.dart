import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:state_management/pages/first_page.dart';
import 'package:state_management/pages/second_page.dart';
import 'package:state_management/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'first',
        routes: {
          'first': (_) => FirstPage(),
          'second': (_) => SecondPage(),
        },
      ),
    );
  }
}

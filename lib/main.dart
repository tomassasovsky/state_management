import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:state_management/pages/first_page.dart';
import 'package:state_management/pages/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'first',
      getPages: [
        GetPage(name: 'first', page: () => FirstPage()),
        GetPage(name: 'second', page: () => SecondPage()),
      ],
    );
  }
}

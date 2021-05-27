import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
            MaterialButton(
              child: Text('Change Age', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {},
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

import 'package:flutter/material.dart';

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试页面'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('dfsdfs'),
            )
          ],
        ));
  }
}

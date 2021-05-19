import 'package:flutter/material.dart';

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试页面'),
          backgroundColor: Colors.red,
        ),
        body: ContentRoute());
  }
}

class ContentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('dfsdfs'),
        )
      ],
    );
  }
}

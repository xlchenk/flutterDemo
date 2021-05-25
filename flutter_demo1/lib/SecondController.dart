import 'package:flutter/material.dart';

class SecondDemoRouter extends StatelessWidget {
  final String title;

  const SecondDemoRouter({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Center(
        child: _Demo1(),
      ),
    );
  }
}

class _Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'hello',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      feedback: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'wold',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

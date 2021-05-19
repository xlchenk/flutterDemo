import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo1/LoginController.dart';
// void main() {
//   runApp(Content());
// }

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo1",
      initialRoute: "contentRoute",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "contentRoute": (context) => ContentRouter(),
        "/LoginController": (context) => LoginRoute()
      },
    );
  }
}

/// 内容一
class ContentRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("自定义页面"),
        ),
        body: TapBoxA());
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              child: Center(
                child: Text(
                  _active ? 'Active' : 'Inactive',
                  style: new TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ),
              width: 200,
              height: 200,
              decoration: new BoxDecoration(
                color: _active ? Colors.lightGreen[700] : Colors.grey[600],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  '金老师邓发多少分身乏术方法似懂非懂',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[500],
              ),
            ),
          ),
          ElevatedButton(
            child: Text("登录"),
            onPressed: () {
              Navigator.of(context).pushNamed("/LoginController");
            },
          ),
          TextButton(
            child: Text("Submit"),
            style: TextButton.styleFrom(
              primary: Colors.red,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {},
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 100.0,
          )
          // Image(image: AssetImage("lib/images/header.jpg"), width: 100.0)
        ],
      ),
    );
  }
}

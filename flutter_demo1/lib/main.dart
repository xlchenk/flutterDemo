import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo1/demo1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  /*
   *routes、initialRoute、onGenerateRoute、onUnknownRoute
   routes : 命名路由
   onGenerateRoute:生成的路由，处理除home和routes以外的路由。 onGenerateRoute 只会对命名路由生效
   如果上面都不匹配则调用onUnknownRoute 
   *   1  2 3 
   *   q  w e r
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "first_Route", //名为"/"的路由作为应用的home(首页)
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: {
        "/demo1": (context) => Content(),
        "first_Route": (context) => RouterTextRoute(),
        "seciond_Route": (context) => SecondRoute(),
        "Tips_Route": (context) =>
            TipsRoute(text: ModalRoute.of(context).settings.arguments),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
      // home: RouterTextRoute(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///命名路由
///
///

/// add by chenxl
class RouterTextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("界面一"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              // var result = await Navigator.push(context, MaterialPageRoute(
              //     // fullscreenDialog: true,
              //     builder: (context) {
              //   return TipsRoute(text: "上个页面传的值");
              // }));
              Navigator.of(context).pushNamed("/demo1");
              // Navigator.of(context).pushNamed("seciond_Route",
              //     arguments: "上个页面传的值 seciond_Route");

              // print("路由返回值：$result");
            },
            child: Text("first page")),
      ),
    );
  }
}

///第二个界面
class SecondRoute extends StatelessWidget {
  // 生成随机字符串
  final wordPair = new WordPair.random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个界面提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(wordPair.toString()),
              Text(ModalRoute.of(context).settings.arguments),
              ElevatedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.pop(context, "我是返回值");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///第二个界面
class TipsRoute extends StatelessWidget {
  TipsRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个界面提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.pop(context, "我是返回值");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///add by chenxls
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dfsldfslfsl两三点解放啦"),
      ),
      body: Center(
        child: Text("乖宝贝宝贝帮不帮爸爸"),
      ),
    );
  }
}

///系统代码
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              child: Text("open new route"),
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

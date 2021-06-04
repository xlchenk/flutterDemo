import 'package:flutter/cupertino.dart';
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
        child: RaisedButton(
          child: Text('切换'),
          onPressed: () {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('提示'),
                    content: Text('需要删除吗？'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('取消'),
                        onPressed: () {
                          Navigator.of(context).pop('canell');
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pop('sure');
                        },
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

class _Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      icon: FlutterLogo(),
      applicationName: '标题',
      applicationVersion: 'V1.0.0',
      applicationIcon: FlutterLogo(),
      applicationLegalese: '专注分享Flutter相关内容',
      child: Text("hello world"),
    );
    Row(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 50,
          width: 140,
        ),
        Flexible(
            child: Container(
          color: Colors.blue,
          height: 50,
        )),
        Container(
          color: Colors.red,
          height: 50,
          width: 100,
        )
      ],
    );
  }
}

class _Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '1 Flex/ 6 Total',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              '2 Flex/ 6 Total',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              '3 Flex/ 6 Total',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
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

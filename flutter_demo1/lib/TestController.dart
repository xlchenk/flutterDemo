import 'package:flutter/material.dart';
import 'package:flutter_demo1/SecondController.dart';

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  print('object');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SecondDemoRouter(
                                title: 'secondTest页面',
                              )));
                })
          ],
          title: Text('测试页面'),
          backgroundColor: Colors.red,
        ),
        body: ContentRoute());
  }
}

class ContentRoute extends StatelessWidget {
  ///头部
  Widget _buildCircleImg() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('lib/images/header.jpg'))),
    );
  }

  ///中间
  Widget _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '我飞翔的走地鸡',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '我心飞翔',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ListViewDemo1();

    Container(
        color: Colors.grey.withOpacity(.5),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  _buildCircleImg(),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: _buildCenter(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _Axis(),
          ],
        ));
  }
}

class _Axis extends StatelessWidget {
  final Widget child;
  const _Axis({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.green, width: 2),
              bottom: BorderSide(color: Colors.green, width: 2))),
    );
  }
}

class _ListViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        reverse: false,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // color: Colors.blue,
            height: 45,
            alignment: Alignment.center,
            child: Text(
              '$index',
              // style: TextStyle(height: 45),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.red,
          );
        },
        itemCount: 15);
  }
}

///数据少的时候
class _ListCuctomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _ListItem(
          title: '1',
        ),
        _ListItem(
          title: '2',
        ),
        _ListItem(
          title: '3',
        ),
        _ListItem(
          title: '4',
        ),
        _ListItem(
          title: '5',
        ),
        _ListItem(
          title: '6',
        ),
      ],
    );
  }
}

// 客服处理中,请耐心等待
class _ListItem extends StatelessWidget {
  final String title;

  const _ListItem({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text('$title'),
      ),
    );
  }
}

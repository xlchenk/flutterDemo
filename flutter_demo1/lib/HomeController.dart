import 'package:flutter/material.dart';
import 'package:flutter_demo1/demo1.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo1/TestController.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("home"),
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.place),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {}),
          ],
        ),
        body: HomePageRoute(title: "瀑布流"));
  }
}

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute>
    with SingleTickerProviderStateMixin {
  List imgList = [
    "http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/a196b367f23ccfd8205b6da647c62b84.png",
    "http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png",
    "http://yanxuan.nosdn.127.net/88dc5d80c6f84102f003ecd69c86e1cf.png",
    "http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png",
    "http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png",
    "http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png",
    "http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png",
    "http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png",
    "http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png",
    'https://picsum.photos/id/101/548/338',
    'http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png',
    'http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png'
  ];

  AnimationController _controller;

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

  Widget itemWidget(int index) {
    String imgPath = imgList[index];
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) {
                return new FullScreenImagePage(imageurl: imgPath);
              },
            ),
          );
        },
        child: new Hero(
          tag: imgPath,
          child: CachedNetworkImage(
            imageUrl: imgPath,
            fit: BoxFit.fitWidth,
            /*    placeholder: (context, url) =>
                      Image.asset('assets/wallfy.png'),*/
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 4,
      itemCount: imgList.length,
      itemBuilder: (context, i) {
        return itemWidget(i);
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index == 0 ? 2.5 : 3), //
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class FullScreenImagePage extends StatefulWidget {
  final String imageurl;
  FullScreenImagePage({Key key, this.imageurl}) : super(key: key);

  @override
  _FullScreenImagePageState createState() {
    return _FullScreenImagePageState();
  }
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("图片详情页面"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: Image.network(
              widget.imageurl,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 250,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 15, top: 4, bottom: 4, right: 15),
                fillColor: Color(0x30cccccc),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00FF0000)),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                hintText: '请输入手机号/身份证号',
                hintStyle: TextStyle(fontSize: 14),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: 300,
              height: 45,
              child: ButtonTheme(
                textTheme: ButtonTextTheme.normal,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: ElevatedButton(
                  child: Text(
                    "按钮",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (content) {
                      return TestRoute();
                    }));
                  },
                ),
              ))
        ],
      ),
    );
  }
}

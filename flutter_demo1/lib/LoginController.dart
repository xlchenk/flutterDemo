import 'package:flutter/material.dart';
import 'package:flutter_demo1/HomeController.dart';
import 'package:flutter_demo1/demo1.dart';

// class ContentRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("登录"),
//         ),
//         body: LoginRoute());
//   }
// }

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                      // padding: EdgeInsets.all(15),

                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            TextStyle(fontSize: 20),
                          ),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Text("登录"),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          //验证通过提交数据
                          print(_unameController.text);
                          print(_pwdController.text);

                          ///跳转页面

                          Navigator.push(context,
                              MaterialPageRoute(builder: (content) {
                            return HomeRoute();
                          }));
                        }
                      },
                    )
                        //     child: DecoratedBox(
                        //   decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //           colors: [Colors.red, Colors.orange[700]]),
                        //       borderRadius: BorderRadius.circular(30),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: Colors.black54,
                        //             offset: Offset(2.0, 2.0),
                        //             blurRadius: 4.0)
                        //       ]),
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 80.0, vertical: 18.0),
                        //     child: Text(
                        //       "登录",
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(color: Colors.white, fontSize: 20),
                        //     ),
                        //   ),
                        // )
                        )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

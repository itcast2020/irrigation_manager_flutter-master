import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  //提交
  void _loginRequst(String TypeText) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Response response;
      var data = {'phone': TypeText};
      response = await Dio()
          .post("http://121.4.216.6:8020/user/login", queryParameters: data);
      await prefs.setString('user_phone', TypeText);
      prefs.setString("user_token", response.data['token']);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("登录"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 46.0, left: 16.0, right: 16.0, bottom: 16.0),
                      child: TextField(
                        autofocus: true,
                        controller: name,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "输入账号",
                            hintStyle: new TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: double.infinity,
                        height: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "输入密码",
                            hintStyle: new TextStyle(color: Colors.grey)),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16.0, left: 20, right: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: 150, //宽度尽可能大
                            minHeight: 50.0 //最小高度为50像素
                            ),
                        child: FlatButton(
                          color: Colors.blue,
                          child: Text(
                            "登录",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _loginRequst(name.text.toString());
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

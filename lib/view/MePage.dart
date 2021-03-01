import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';
import 'RepairPage.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  bool isLogin;
  String _name;

  @override
  void initState() {
    super.initState();
    isLogin = false;
    _name = '未登录';
  }

  void _mePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.get('user_token') != '') {
        isLogin = true;
        _name = prefs.get('user_phone');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('个人资料'),
          actions: [
            FlatButton(
              child: new Text(
                '编辑',
                textScaleFactor: 1.3,
                style: new TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RepairPage();
                }));
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: GestureDetector(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: double.infinity, minHeight: 70.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'images/cat.jpg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(_name)
                    ],
                  ),
                ),
                onTap: () {
                  if (!isLogin)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    })).then((value) => _mePage());
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              color: Color.fromRGBO(204, 204, 204, 100),
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              color: Color.fromRGBO(204, 204, 204, 100),
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: new Text('账号'),
              ),
            ),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.blue),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '8888888888',
                      ),
                    ),
                  ],
                ),
                onPressed: () => {}),
            Container(
              width: double.infinity,
              height: 40.0,
              color: Color.fromRGBO(204, 204, 204, 100),
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: new Text('所属单位'),
              ),
            ),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.blue),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '南华大学',
                      ),
                    ),
                  ],
                ),
                onPressed: () => (null)),
            Container(
              width: double.infinity,
              height: 40.0,
              color: Color.fromRGBO(204, 204, 204, 100),
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: new Text('负责区域'),
              ),
            ),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_city, color: Colors.blue),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '烘箱小区',
                      ),
                    ),
                  ],
                ),
                onPressed: () => (null)),
            Container(
              width: double.infinity,
              height: 40.0,
              color: Color.fromRGBO(204, 204, 204, 100),
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: new Text('工作时间'),
              ),
            ),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.access_time, color: Colors.blue),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '十年',
                      ),
                    ),
                  ],
                ),
                onPressed: () => (null)),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 30.0,
                color: Color.fromRGBO(204, 204, 204, 100),
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

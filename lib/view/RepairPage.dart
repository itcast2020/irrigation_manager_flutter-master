import 'package:flutter/material.dart';

class RepairPage extends StatefulWidget {
  RepairPage({Key key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  TextEditingController m1 = TextEditingController();
  TextEditingController m2 = TextEditingController();
  TextEditingController m3 = TextEditingController();
  TextEditingController m4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('编辑资料'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                        Text("点击修改头像")
                      ],
                    ),
                  ),
                  onTap: () {
                    //修改头像
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 20.0,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
                      child: TextField(
                        autofocus: true,
                        controller: m1,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "修改昵称",
                            hintStyle: new TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: m2,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            hintText: "修改密码",
                            hintStyle: new TextStyle(color: Colors.grey)),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: m3,
                        decoration: InputDecoration(
                            icon: Icon(Icons.location_city),
                            hintText: "修改所属单位",
                            hintStyle: new TextStyle(color: Colors.grey)),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: m4,
                        decoration: InputDecoration(
                            icon: Icon(Icons.location_on),
                            hintText: "修改负责区域",
                            hintStyle: new TextStyle(color: Colors.grey)),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 10.0,
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
                            "确认修改",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.pop(context),
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

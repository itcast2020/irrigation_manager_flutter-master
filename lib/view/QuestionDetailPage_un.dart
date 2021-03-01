import 'package:flutter/material.dart';
import 'package:irrigation/data/DaTa.dart';


class QuestionDetailPage_un extends StatelessWidget {
  DaTa datt;

  //QuestionDetailPageun({Key key, @required this.datt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '问题反馈界面',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: new AppBar(
            leading: new IconButton(
                icon: Icon(Icons.arrow_back_ios),
                // alignment: Alignment.topLeft,
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: new Text('问题详情'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 570.0,
                  child:
                  new ListView(scrollDirection: Axis.vertical, children: <
                      Widget>[
                    new Container(
                      child: new Text('植株种类：',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new Text(datt.spices,
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.black)),
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                    ),
                    new Container(
                      child: new Text('问题描述：',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new Text(datt.question,
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.black)),
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                      height: 100.0,
                    ),
                    new Container(
                      child: new Text('相关照片',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new Icon(Icons.add_circle_outline, size: 100),
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                    ),
                  ]))
            ],
          )),
    );
  }
}
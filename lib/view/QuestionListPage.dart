import 'package:flutter/material.dart';
import 'package:irrigation/view/Question_allPage.dart';
import 'AskPage.dart';
import 'Question_allPage.dart';
import 'Question_backPage.dart';
import 'Question_unreplyPage.dart';
import 'Question_replyPage.dart';


class QuestionListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return QuestionListState();
  }
}

class QuestionListState extends State<QuestionListPage> {

  TabController mController;
  List<Widget> pages = List<Widget>();


  final List<Tab> myTabs = <Tab>[
    new Tab(text: '问题总览'),
    new Tab(text: '未回复'),
    new Tab(text: '已回复'),
    new Tab(text: '已打回'),
  ];


  @override
  void initState() {
    pages..add(Question_allPage())..add(Question_unreplyPage())..add(Question_replyPage())..add(Question_backPage());
    mController = TabController(
      length: myTabs.length,
      vsync: ScrollableState(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('问题反馈'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.add_circle_outline,size: 35.0,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AskPage();
                  }));
                })
          ],
          bottom: new TabBar(
            tabs: myTabs,
            unselectedLabelColor: Colors.black45,
            //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
            unselectedLabelStyle: TextStyle(fontSize: 20,color: Colors.grey),
            //设置未选中时的字体样式，tabs里面的字体样式优先级最高
            labelColor: Colors.white,
            controller: mController,
            labelStyle: TextStyle(fontSize: 20.0),
            isScrollable: true,
          ),
        ),
        body:
           TabBarView(
             controller: mController,
               children: pages,
           )
        );
  }
}

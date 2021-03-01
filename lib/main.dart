import 'package:flutter/material.dart';
import 'package:irrigation/view/QuestionListPage.dart';
import 'package:irrigation/view/DevicePage.dart';
import 'package:irrigation/view/MePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = List<Widget>();//需要切换的page

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages..add(DevicePage())..add(QuestionListPage())..add(MePage());
  }

  BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    this.buildContext = context;
    return Scaffold(
      body:
      IndexedStack(
          index: _selectedIndex, children: pages
      ),
      bottomNavigationBar:bottomBar(),//所记录的笔记布局
    );
  }


  bottomBar() {
    return BottomNavigationBar( // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.device_hub,color: Colors.black,),title: Text('设备',style: new TextStyle(color: Colors.black),)),
        BottomNavigationBarItem(icon: Icon(Icons.report_problem,color: Colors.black), title: Text('问题反馈',style: new TextStyle(color: Colors.black))),
        BottomNavigationBarItem(icon: Icon(Icons.people,color: Colors.black), title: Text('我',style: new TextStyle(color: Colors.black))),
      ],
      onTap: _onItemTapped,
      fixedColor: Colors.grey,
      currentIndex: _selectedIndex,
    );
  }

  int _selectedIndex = 0;
  void _onItemTapped(int value) {//底部选择
    setState(() {
      _selectedIndex = value;
    });
  }
}

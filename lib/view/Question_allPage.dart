import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:irrigation/data/DaTa.dart';
import 'package:irrigation/uitils/HttpController.dart';
import 'package:irrigation/view/QuestionDetailPage.dart';

class Question_allPage extends StatelessWidget {
  List<DaTa> characters = getData();


  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();



    for (int i = 0; i < characters.length; i++) {
      _list.add(buildListData(context, characters[i].title,
          characters[i].time, characters[i].question, i));
    }
    // 分割线
    var divideTiles =
    ListTile.divideTiles(context: context, tiles: _list).toList();

    return new Scaffold(
      body: new Scrollbar(
        child: new ListView.separated(
            itemBuilder: (context, item) {
              return buildListData(
                  context,
                  characters[item].title,
                  characters[item].time,
                  characters[item].question,
                  item);
            },
            separatorBuilder: (BuildContext context, int index) =>
            new Divider(),
            itemCount: characters.length),
      ),
    );
  }

  Widget buildListData(BuildContext context, String titleItem, String time,
      String question, int i) {
    return new ListTile(
      // leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        time,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionDetailPage(datt: characters[i]),
          ),
        );
      },
    );
  }
}

List<DaTa> getData(){
  Map<String, String> map = new Map();

  HttpController.post("http://121.4.216.6:8020/ask/add/question", (data) {
    if (data != null) {
      final body = json.decode(data.toString());
      final feeds = body["result"];
      var items = [];
      feeds.forEach((item) {
        items.add(DaTa(item["title"], item["time"], item["question"]));
      });
      return items;
    }
  }, params: map);}

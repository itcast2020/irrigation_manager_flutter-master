import 'package:flutter/material.dart';
import 'package:irrigation/data/DaTa.dart';
import 'package:irrigation/view/QuestionDetailPage.dart';

class Question_unreplyPage extends StatelessWidget {
  List<DaTa> characters = LisetData();

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

List<DaTa> LisetData() {
  List<DaTa> characters = new List<DaTa>();
  for (int i = 0; i < 10; i++) {
     characters.add(new DaTa('hhhh','2003.3.9', '安居客将'));
  }
  return characters;
}
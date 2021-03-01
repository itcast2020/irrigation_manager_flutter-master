import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskPage extends StatelessWidget {
  var imageSrc;
  TextEditingController _spicesText =  TextEditingController();
  TextEditingController _titleText = TextEditingController();
  TextEditingController _timeText = TextEditingController();
  TextEditingController _questionText = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: new AppBar(
            title: new Text('询问专家'),
            actions: [
              FlatButton(
                  onPressed:(){
                    _postData(_spicesText.text.toString(),_titleText.text.toString(),_timeText.text.toString(),_questionText.text.toString());
                  },
                  child: new Icon(Icons.send, size: 30.0))
            ],
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
                      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new TextField(
                         controller: _spicesText,
                          decoration:
                          InputDecoration(border: InputBorder.none)),
                      height: 30.0,
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                    ),
                    new Container(
                      child: new Text('问题标题：',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new TextField(
                        controller: _titleText,
                          decoration:
                          InputDecoration(border: InputBorder.none)),
                      color: Colors.white,
                      height: 30.0,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                    ),
                    new Container(
                      child: new Text('问题发生时间：',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new TextField(
                    //  controller: _timeText,
                          decoration:
                          InputDecoration(border: InputBorder.none)),
                      color: Colors.white,
                      height: 30.0,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                    ),
                    new Container(
                      child: new Text('问题描述：',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new TextField(
                          controller: _questionText,
                          decoration:
                          InputDecoration(border: InputBorder.none)),
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                      height: 100.0,
                    ),
                    new Container(
                      child: new Text('选择照片',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 3.0),
                    ),
                    new Container(
                      child: new IconButton(
                          icon: Icon(Icons.add_circle_outline,size: 100.0,),

                        /*  onPressed: () {

                            Column(
                              children: <Widget>[
                                this.imageSrc == null ? Center(
                                  child: Text("请选择图片或拍照"),
                                ) : Image.file(this.imageSrc),
                                RaisedButton(
                                  onPressed: _openGallery,
                                  child: Text("选择照片"),
                                )
                              ],
                            );

                          }*/),
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                    )
                  ]))
            ],
          )
    );
  }

  /*_openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageSrc = image;
    });
    print("image $image");
  }
  void setState(Null Function() param0) {}*/


  void _postData(String spices,String title,String time,String question) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Response response;
      var data = {'title': title,
                  'spices':spices,
                  'question':"病情发生时间为："+time+","+question,
                  'token':response.data['token'],
                //  'file':;

      };
      response = await Dio()
          .post("http://121.4.216.6:8020/ask/add/question", queryParameters: data);
     // await prefs.setString('user_phone', TypeText);
      prefs.setString("user_token", response.data['token']);
    } catch (e) {
      print(e);
    }
  }


}
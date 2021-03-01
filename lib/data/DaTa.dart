import 'package:flutter/material.dart';

class DaTa {
  String _title;
  String _question;
  String _spices;
  String _pic;
  String _uid;
  String _id;
  String _reply;
  String _rep_pic;
  String _time;
  String _sname;
  int  _putback;

  String get question => _question;

  set question(String value) {
    _question = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get spices => _spices;

  set spices(String value){
    _spices = value;
  }

  get pic => _pic;

  set pic(String value) {
    _pic = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get reply => _reply;

  set reply(String value) {
    _reply = value;
  }

  String get rep_pic => _rep_pic;

  set rep_pic(String value) {
    _rep_pic = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  String get sname => _sname;

  set sname(String value) {
    _sname = value;
  }

  int get putback => _putback;

  set putback(int value) {
    _putback = value;
  }

  DaTa(this._title, this._time, this._question);


  /*DaTa.fromJson(Map<String, dynamic> json)
      : _time = json['time'],
        _title = json['title'],
        _question=json['question'];


  Map<String, dynamic> toJson() =>
      {
        'time': _time,
        'title': _title,
        'question':_question
      };*/

}





/*
选择照片，手机权限问题                AskPage   添加照片

将string 类型的图片路径显示成照片     detailPage  显示照片

怎么把图片上传            AskPage 上传图片文件-Dio

怎样判断已回复未回复，专家回复如何获取

*/


//查询问题不急


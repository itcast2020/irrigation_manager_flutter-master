import 'package:flutter/material.dart';
import 'package:irrigation/data/Callback.dart';
import 'package:irrigation/model/LoginModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BaseViewModel.dart';

///首页ViewModel类，用来和业务层交互
///author:liuhc
class LoginViewModel extends BaseViewModel {
  BehaviorSubject<String> _dataObservable = BehaviorSubject();

  Stream<String> get dataStream => _dataObservable.stream;

  LoginModel _model;

  @override
  void dispose() {
    _dataObservable.close();
  }

  @override
  void doInit(BuildContext context) {
    _model = LoginModel();
  }

  postLogin(var username, password, Function function) {
    if (_model == null) {
      _model = LoginModel();
    }
    _model.submitLogin(username, password).then((result) => {
          _saveToken(result, username).then((value) =>
              {print("返回的信息" + value.toString()), value ? function() : null})
        });
  }

  Future<bool> _saveToken(CallBack callBack, var username) async {
    if (callBack != null && callBack.success) {
      var token = callBack.data['token'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      print(sharedPreferences.getString('token'));
      return true;
    }
    return false;
  }

  @override
  Future getData(BuildContext context) {
    // TODO: implement getData
    throw UnimplementedError();
  }
}

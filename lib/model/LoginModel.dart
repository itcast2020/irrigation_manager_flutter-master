import 'package:irrigation/data/Callback.dart';
import 'package:irrigation/uitils/HttpsUtil.dart';

class LoginModel {
  Future<CallBack> submitLogin(var username, password) async {
    RegExp nameReg = new RegExp(r'^[A-Za-z0-9\u4e00-\u9fa5]{2,12}$');
    RegExp passwordReg = new RegExp(
        r'^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,20}$');
    if (passwordReg.hasMatch(password) && nameReg.hasMatch(username)) {
      Map<String, dynamic> map = Map();
      map['username'] = username;
      map['password'] = password;
      CallBack callBack = await HttpsUtil.postResponseWithArgus(
          "http://192.168.0.113:8090/user/login", map, false);
      return callBack;
    }
    return CallBack(success: false);
  }
}

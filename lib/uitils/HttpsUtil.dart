import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:irrigation/data/Callback.dart';

class HttpsUtil {
  static Future<CallBack> getResponse(var url) async {
    try {
      Response response = await Dio().get(url);
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return null;
  }


  static Future<CallBack> postResponseWithArgus(var url,
      Map<String, dynamic> argus, [bool isData]) async {
    try {
      Response response;
      if (isData) {
        response = await Dio().post(url, data: argus);
      } else {
        response = await Dio().post(url, queryParameters: argus);
      }
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

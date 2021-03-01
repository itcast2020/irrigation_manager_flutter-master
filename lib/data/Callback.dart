class CallBack{
  bool success;
  int code;
  String message;
  Map<String, dynamic> data;

  CallBack({this.success,this.code,this.message,this.data});

  factory CallBack.fromJson(Map<String, dynamic> json) {
    return CallBack(success: json['success'], code: json['code'],message: json['message'],data: json['data']);
  }
}
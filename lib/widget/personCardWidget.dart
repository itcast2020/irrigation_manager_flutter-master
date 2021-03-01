import 'package:flutter/material.dart';
import 'package:irrigation/view/LoginPage.dart';
import 'package:irrigation/view/MePage.dart';

class personCardWidget extends StatelessWidget {
  const personCardWidget({Key key, @required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: GestureDetector(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: double.infinity, minHeight: 70.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              message(isLogin),
            ],
          ),
        ),
        onTap: () {
          // if (isLogin) {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     return MePage();
          //   }));
          // } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          // }
        },
      ),
    );
  }

  message(bool isLogin) {
    if (isLogin) {
      return Text(
        '     点击修改图片',
        textScaleFactor: 2,
      );
    } else {
      return Text(
        '     未登录',
        textScaleFactor: 2,
      );
    }
  }
}

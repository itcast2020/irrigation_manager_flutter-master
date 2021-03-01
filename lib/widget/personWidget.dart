// import 'package:flutter/material.dart';
// import 'package:irrigation/widget/personCardWidget.dart';

// Widget personWidget() {
//   bool isLogin = true;

//   return new Scaffold(
//       body: Column(
//     children: [
//       //头像信息
//       personCardWidget(isLogin: isLogin),
//       //其他选项
//       personOtherCard()
//     ],
//   ));
// }

// personOtherCard() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Container(
//         width: double.infinity,
//         height: 50.0,
//         color: Color.fromRGBO(204, 204, 204, 100),
//       ),
//       ConstrainedBox(
//         constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
//         child: FlatButton(
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.alarm, color: Colors.blue),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     '提醒',
//                   ),
//                 ),
//               ],
//             ),
//             onPressed: () => (null)),
//       ),
//       Container(
//         width: double.infinity,
//         height: 30.0,
//         color: Color.fromRGBO(204, 204, 204, 100),
//       ),
//       ConstrainedBox(
//         constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
//         child: FlatButton(
//           child: Row(
//             children: <Widget>[
//               Icon(Icons.assessment, color: Colors.blue),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   '统计',
//                 ),
//               ),
//             ],
//           ),
//           onPressed: () => (null),
//         ),
//       ),
//       Container(
//         width: double.infinity,
//         height: 30.0,
//         color: Color.fromRGBO(204, 204, 204, 100),
//       ),
//       ConstrainedBox(
//           constraints:
//               BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
//           child: FlatButton(
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.location_on, color: Colors.blue),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     '定位',
//                   ),
//                 ),
//               ],
//             ),
//             onPressed: () => {},
//           )),
//       Container(
//         width: double.infinity,
//         height: 30.0,
//         color: Color.fromRGBO(204, 204, 204, 100),
//       ),
//       ConstrainedBox(
//         constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
//         child: FlatButton(
//           onPressed: () => {},
//           child: Row(
//             children: <Widget>[
//               Icon(Icons.settings, color: Colors.blue),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Hero(
//                   tag: "settings",
//                   child: Text(
//                     '设置',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // Expanded(
//       //   child:
//       Container(
//         width: double.infinity,
//         height: 30.0,
//         color: Color.fromRGBO(204, 204, 204, 100),
//       ),
//       // )
//     ],
//   );
// }

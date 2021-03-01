import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DevicePageState();
  }
}

class DevicePageState extends State<DevicePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备控制"),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CustomNotification extends Notification {
  CustomNotification(this.msg);

  final String msg;
}

//抽离出一个子Widget用来发通知
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          CustomNotification("Hi").dispatch(context);
        },
        child: Container(
            child: const Text(
              '点击我',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            )));
  }
}

class MyHomePageNotificationState extends State<MyHomePage> {
  String _msg = "通知：";

  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += "${notification.msg}  ";
          }); //收到子Widget通知，更新msg
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_msg), CustomChild()], //将子Widget加入到视图树中
        ));
  }
}

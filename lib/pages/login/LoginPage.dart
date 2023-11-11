import 'package:com.jc.livechat/pages/login/LoginPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  TextEditingController _unameController = TextEditingController();
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _unameController,
            autofocus: true,
            decoration: InputDecoration(labelText: "用户名", hintText: "用户名或邮箱"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "密码", hintText: "登录密码"),
            obscureText: true,
            onChanged: (v) {
              password = v;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            child: const Text("登录"),
            onPressed: () {
              controller.login(_unameController.text, password);
            },
          )
        ],
      ),
    ));
  }
}

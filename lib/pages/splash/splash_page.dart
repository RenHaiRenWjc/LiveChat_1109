import 'package:com.jc.livechat/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/LogTools.dart';


class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogTools.d("TAG", ": build");
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/login/wy_pic_login_bg.png'),
                  fit: BoxFit.cover),
            ),
            child: GetBuilder<SplashController>(
                init: SplashController(),
                builder: (controller) {
                  debugPrint("SplashController init");
                  return const Center(
                      child: Text('欢迎来到xxx',
                          style:
                              TextStyle(fontSize: 32, color: Colors.black54)));
                }),
          )
        ],
      ),
    );
  }
}

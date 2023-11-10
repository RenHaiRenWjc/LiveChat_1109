import 'package:com.jc.livechat/router/AppRoutes.dart';
import 'package:com.jc.livechat/router/GetPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialization(null);
  runApp(const MyApp());
}

//启动图延时移除方法
void initialization(BuildContext? context) async {
  //延迟3秒
  await Future.delayed(const Duration(seconds: 30));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'livechat',
            // home:  const SplashPage(),
            // initialBinding: SplashBinding(),
            enableLog: true,
            initialRoute: AppRoutes.splash,
            getPages: GetPages.routes,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
          );
        });
  }
}
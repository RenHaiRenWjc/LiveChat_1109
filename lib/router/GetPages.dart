import 'package:com.jc.livechat/pages/login/LoginPage.dart';
import 'package:com.jc.livechat/pages/login/LoginPageController.dart';
import 'package:com.jc.livechat/pages/main/MainController.dart';
import 'package:com.jc.livechat/pages/main/MainController.dart';
import 'package:com.jc.livechat/pages/main/MainPage.dart';
import 'package:com.jc.livechat/pages/splash/SplashController.dart';
import 'package:com.jc.livechat/pages/splash/SplashPage.dart';
import 'package:get/get.dart';

import 'AppRoutes.dart';

class GetPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage(), binding: BindingsBuilder(() => Get.lazyPut<SplashController>(() => SplashController()))),
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: BindingsBuilder(() => Get.lazyPut<LoginPageController>(() => LoginPageController()))),
    GetPage(name: AppRoutes.main, page: () => MainPage(), binding: BindingsBuilder(() => Get.lazyPut<MainController>(() => MainController()))),
  ];
}

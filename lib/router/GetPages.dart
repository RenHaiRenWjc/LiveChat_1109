import 'package:com.jc.livechat/pages/splash/SplashController.dart';
import 'package:com.jc.livechat/pages/splash/SplashPage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'AppRoutes.dart';

class GetPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage(), binding: BindingsBuilder(() => Get.lazyPut<SplashController>(() => SplashController()))),
  ];
}

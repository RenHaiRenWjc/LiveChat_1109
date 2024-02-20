import 'package:com.jc.livechat/pages/chat/ChatLogic.dart';
import 'package:com.jc.livechat/pages/chat/ChatPage.dart';
import 'package:com.jc.livechat/pages/login/LoginPage.dart';
import 'package:com.jc.livechat/pages/login/LoginPageController.dart';
import 'package:com.jc.livechat/pages/main/MainController.dart';
import 'package:com.jc.livechat/pages/main/MainPage.dart';
import 'package:com.jc.livechat/pages/main/home/HomeLogic.dart';
import 'package:com.jc.livechat/pages/main/home/HomePage.dart';
import 'package:com.jc.livechat/pages/main/me/MineLogic.dart';
import 'package:com.jc.livechat/pages/main/me/MinePage.dart';
import 'package:com.jc.livechat/pages/main/message/ConversationPage.dart';
import 'package:com.jc.livechat/pages/splash/SplashController.dart';
import 'package:com.jc.livechat/pages/splash/SplashPage.dart';
import 'package:com.jc.livechat/pages/test/TestPage.dart';
import 'package:get/get.dart';

import '../pages/main/message/ConversationLogic.dart';
import 'AppRoutes.dart';

class GetPages {
  static final routes = [
    GetPage(
        name: AppRoutes.splash, page: () => SplashPage(), binding: BindingsBuilder(() => Get.lazyPut<SplashController>(() => SplashController()))),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: BindingsBuilder(() => Get.lazyPut<LoginPageController>(() => LoginPageController()))),
    GetPage(name: AppRoutes.main, page: () => MainPage(), binding: BindingsBuilder(() => Get.lazyPut<MainController>(() => MainController()))),
    GetPage(
        name: AppRoutes.conversation,
        page: () => ConversationPage(),
        binding: BindingsBuilder(() => Get.lazyPut<ConversationLogic>(() => ConversationLogic()))),
    GetPage(name: AppRoutes.home, page: () => HomePage(), binding: BindingsBuilder(() => Get.lazyPut<HomeLogic>(() => HomeLogic()))),
    GetPage(name: AppRoutes.mine, page: () => MinePage(), binding: BindingsBuilder(() => Get.lazyPut<MineLogic>(() => MineLogic()))),
    GetPage(name: AppRoutes.chat, page: () => ChatPage(), binding: BindingsBuilder(() => Get.lazyPut<ChatLogic>(() => ChatLogic()))),
    GetPage(name: AppRoutes.test, page: () => TestPage()),
  ];
}

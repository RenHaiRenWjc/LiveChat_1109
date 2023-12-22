import 'package:com.jc.livechat/bean/UserInfo.dart';
import 'package:com.jc.livechat/pages/manager/UserInfoManager.dart';
import 'package:com.jc.livechat/router/AppRoutes.dart';
import 'package:get/get.dart';

import '../../common/LogTools.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    autoLogin();
  }

  Future<void> autoLogin() async {
    UserInfoManager().fetchSpUserInfo().then((value) {
      LogTools.d("SplashController", ":fetchSpUserInfo value=$value ");
      if (value == null) {
        Get.toNamed(AppRoutes.main);
      } else {
        Get.toNamed(AppRoutes.main);
      }
    });
  }
}

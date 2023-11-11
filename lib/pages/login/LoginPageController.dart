import 'package:com.jc.livechat/network/ApiService.dart';
import 'package:com.jc.livechat/network/ServiceHttp.dart';
import 'package:com.jc.livechat/router/AppRoutes.dart';
import 'package:get/get.dart';

import '../../common/LogTools.dart';

class LoginPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void login(String username, String password) async {
    Map<String, dynamic> params = {"username": username, "password": password};
    var loginResult = await ServiceHttp().post(ApiService.login, params: params);
    LogTools.d("TAG", ": loginResult=${loginResult.toString()}");
    if (loginResult.ok) {
      Get.offAllNamed(AppRoutes.main);
      return;
    }
    Get.snackbar("Login Failed", "msg:${loginResult.errorEntity?.message},code=${loginResult.errorEntity?.code}", snackPosition: SnackPosition.BOTTOM);
    var register = await ServiceHttp().post(ApiService.register, params: params);
    if (register.ok) {
      Get.offAllNamed(AppRoutes.main);
      return;
    }
  }
}

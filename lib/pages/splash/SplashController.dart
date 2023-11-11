import 'package:com.jc.livechat/router/AppRoutes.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    autoLogin();
  }

  Future<void> autoLogin() async {
    Get.toNamed(AppRoutes.login);
    // var mAccountInfo = MineInfo().wyGetAccountFromLocal();
    // LogTools.i("TAG", "mAccountInfo=$mAccountInfo");
    // if (mAccountInfo == null) {
    //   Get.toNamed(AppRoutes.LoginCode);
    //   return;
    // }
    //
    // var ticketModel =
    //     await WyAuthService.awGetAuthTicket(mAccountInfo.access_token!);
    // LogTools.d("TAG", " ticketModel=$ticketModel");
    // if (ticketModel == null) {
    //   Get.toNamed(AppRoutes.LoginCode);
    //   return;
    // }
    // MineInfo().account!.ticket = ticketModel.tickets?[0]["ticket"];
    // MineInfo().wySaveAccountToLocal();
    //
    // var userInfo = await WyAuthService.awGetUserInfo(MineInfo().account!.uid!);
    // LogTools.d("TAG", " userInfo=$userInfo");
    // if (userInfo != null && userInfo.uid == MineInfo().account?.uid) {
    //   MineInfo().userInfo = userInfo;
    //   MineInfo().wySaveUserInfoToLocal();
    //   NimManager().beginLoginNim();
    //   Get.offAllNamed(AppRoutes.Home);
    // } else {
    //   Get.toNamed(AppRoutes.LoginCode);
    // }
  }
}

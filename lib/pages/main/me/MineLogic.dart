import 'package:get/get.dart';

import '../../../common/LogTools.dart';

class MineLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
    LogTools.i("TAG", "onInit: MineLogic-----");
  }

  @override
  void onReady() {
    super.onReady();
    LogTools.i("TAG", "onReady: MineLogic-----");
  }

  @override
  void onClose() {
    super.onClose();
    LogTools.i("TAG", "onClose: MineLogic-----");
  }
}

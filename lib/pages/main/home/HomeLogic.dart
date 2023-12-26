import 'package:get/get.dart';

import '../../../common/LogTools.dart';


class HomeLogic extends GetxController {
  // final MessageState state = MessageState();
  @override
  void onInit() {
    super.onInit();
    LogTools.i("TAG", "onInit: HomeLogic");
  }

  @override
  void onReady() {
    super.onReady();
    LogTools.i("TAG", "onReady: HomeLogic");

  }

  @override
  void onClose() {
    super.onClose();
    LogTools.i("TAG", "onClose: HomeLogic");
  }
}

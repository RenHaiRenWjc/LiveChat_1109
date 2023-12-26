import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/LogTools.dart';
import '../../../tim_ui_kit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';
import 'MineLogic.dart';

class MinePage extends GetView<MineLogic> {
  MinePage({Key? key}) : super(key: key);

  // final logic = Get.put(MessageLogic());
  // final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    LogTools.d("TAG", "MinePage: build--");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Text("我的页面"),
      ),
    );
  }
}

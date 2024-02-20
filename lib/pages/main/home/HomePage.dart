import 'package:com.jc.livechat/router/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/LogTools.dart';
import '../../../tim_ui_kit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';
import 'HomeLogic.dart';

class HomePage extends GetView<HomeLogic> {
  HomePage({Key? key}) : super(key: key);

  // final logic = Get.put(MessageLogic());
  // final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    LogTools.i("TAG", ": HomePage build");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Column(
          children: [
            Text("首页"),
            Text("test"),
            GestureDetector(
              onTap: () => {Get.toNamed(AppRoutes.test)},
              child: Text("测试"),
            )
          ],
        ),
      ),
    );
  }
}



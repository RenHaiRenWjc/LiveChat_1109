import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/LogTools.dart';
import '../../../router/AppRoutes.dart';
import '../../../tim_ui_kit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';
import 'ConversationLogic.dart';

class ConversationPage extends GetView<ConversationLogic> {
  ConversationPage({Key? key}) : super(key: key);

  // final logic = Get.put(MessageLogic());
  // final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    LogTools.d("TAG", "build: ConversationPage--");
    return Scaffold(
      appBar: AppBar(
        title: const Text("消息"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: TIMUIKitConversation(
            onTapItem: (value) {
              Get.toNamed(AppRoutes.chat, arguments: value);
            },
          ),
        ),
      ),
    );
  }
}

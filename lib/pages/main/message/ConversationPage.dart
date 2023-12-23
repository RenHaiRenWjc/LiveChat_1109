import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../tim_ui_kit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';
import 'ConversationLogic.dart';

class ConversationPage extends GetView<ConversationLogic> {
  ConversationPage({Key? key}) : super(key: key);

  // final logic = Get.put(MessageLogic());
  // final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("消息"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(child: TIMUIKitConversation(),),
      ),
    );
  }
}

import 'package:com.jc.livechat/tim_ui_kit/tencent_cloud_chat_uikit.dart';

class TIMUIKitChatUtils {
  static String? getMessageIDWithinIndex(
      List<V2TimMessage?> messageList, int index) {
    if (messageList[index]!.elemType == 11) {
      if (index > 0) {
        return getMessageIDWithinIndex(messageList, index - 1);
      }
    }
    return messageList[index]!.msgID;
  }
}

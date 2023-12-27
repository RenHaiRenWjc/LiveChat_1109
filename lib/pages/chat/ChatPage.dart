// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/LogTools.dart';
import '../../tim_ui_kit/tencent_cloud_chat_uikit.dart';
import '../../tim_ui_kit/ui/views/TIMUIKitChat/tim_uikit_chat.dart';
import 'ChatLogic.dart';

class ChatPage extends GetView<ChatLogic> {
  V2TimConversation? selectedConversation;

  // const ChatPage({Key? key}) : super(key: key);

  Widget renderCustomStickerPanel(
      {sendTextMessage,
      sendFaceMessage,
      deleteText,
      addCustomEmojiText,
      addText,
      List<CustomEmojiFaceData> defaultCustomEmojiStickerList = const [],
      double? height,
      double? width}) {
    final defaultEmojiList = defaultCustomEmojiStickerList.map((customEmojiPackage) {
      return CustomStickerPackage(
          name: customEmojiPackage.name,
          baseUrl: "assets/custom_face_resource/${customEmojiPackage.name}",
          isEmoji: customEmojiPackage.isEmoji,
          isDefaultEmoji: true,
          stickerList: customEmojiPackage.list.asMap().keys.map((idx) => CustomSticker(index: idx, name: customEmojiPackage.list[idx])).toList(),
          menuItem: CustomSticker(
            index: 0,
            name: customEmojiPackage.icon,
          ));
    }).toList();
    return StickerPanel(
        sendTextMsg: sendTextMessage,
        sendFaceMsg: (index, data) => sendFaceMessage(index + 1, (data.split("/")[3]).split("@")[0]),
        deleteText: deleteText,
        addText: addText,
        addCustomEmojiText: addCustomEmojiText,
        customStickerPackageList: [
          ...defaultEmojiList,
        ]);
  }

  @override
  Widget build(BuildContext context) {
    selectedConversation = Get.arguments;
    LogTools.d("TAG", "chatPage: selectedConversation =$selectedConversation");
    return TIMUIKitChat(
      conversation: selectedConversation ?? V2TimConversation(conversationID: "c2c_10040818", userID: "10040818", showName: "Test Chat", type: 1),
      customStickerPanel: renderCustomStickerPanel,
      config: const TIMUIKitChatConfig(
        // 仅供演示，非全部配置项，实际使用中，可只传和默认项不同的参数，无需传入所有开关
        isAllowClickAvatar: true,
        isUseDefaultEmoji: true,
        isAllowLongPressMessage: true,
        isShowReadingStatus: true,
        isShowGroupReadingStatus: true,
        notificationTitle: "",
        isUseMessageReaction: true,
        groupReadReceiptPermissionList: [GroupReceiptAllowType.work, GroupReceiptAllowType.meeting, GroupReceiptAllowType.public],
      ),
    );
  }
}

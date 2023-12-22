import 'package:com.jc.livechat/tim_ui_kit/tencent_cloud_chat_uikit.dart';

class UserProfile {
  late V2TimFriendInfo? friendInfo;
  late V2TimConversation? conversation;

  UserProfile({required this.friendInfo, required this.conversation});
}

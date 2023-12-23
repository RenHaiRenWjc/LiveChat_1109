library tencent_cloud_chat_uikit;

import 'package:tencent_im_base/tencent_im_base.dart';

// import 'package:tim_ui_kit/data_services/services_locatar.dart';
import 'data_services/core/core_services_implements.dart';
import 'data_services/services_locatar.dart';
export 'data_services/core/core_services_implements.dart';
export 'package:tencent_im_base/theme/tui_theme.dart';
export 'package:tencent_im_base/theme/color.dart';

// Sticker
export 'package:tim_ui_kit_sticker_plugin/tim_ui_kit_sticker_plugin.dart';

// Widgets
export 'ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';

// export 'ui/views/TIMUIKitChat/tim_uikit_chat.dart';
// export 'ui/views/TIMUIKitProfile/tim_uikit_profile.dart';
// export 'ui/views/TIMUIKitProfile/widget/tim_uikit_operation_item.dart';
export 'ui/views/TIMUIKitContact/tim_uikit_contact.dart';

// export 'ui/views/TIMUIKitGroup/tim_uikit_group.dart';
export 'ui/views/TIMUIKitBlackList/tim_uikit_black_list.dart';

// export 'ui/views/TIMUIKitNewContact/tim_uikit_new_contact.dart';
// export 'ui/views/TIMUIKitNewContact/tim_uikit_unread_count.dart';
// export 'ui/views/TIMUIKitGroupProfile/tim_uikit_group_profile.dart';
export 'ui/views/TIMUIKitChat/TIMUIKItMessageList/tim_uikit_chat_history_message_list_item.dart';
export 'ui/widgets/unread_message.dart';

// export 'ui/views/TIMUIKitAddFriend/tim_uikit_add_friend.dart';
// export 'ui/views/TIMUIKitAddGroup/tim_uikit_add_group.dart';
export 'ui/views/TIMUIKitChat/TIMUIKitTextField/tim_uikit_more_panel.dart';

// export 'ui/views/TIMUIKitSearch/tim_uikit_search.dart';
// export 'ui/views/TIMUIKitSearch/tim_uikit_search_msg_detail.dart';
export 'ui/views/TIMUIKitChat/TIMUIKitTextField/tim_uikit_text_field_controller.dart';
export 'ui/views/TIMUIKitChat/TIMUIKitAppBar/tim_uikit_appbar.dart';
export 'ui/views/TIMUIKitChat/TIMUIKItMessageList/tim_uikit_chat_history_message_list.dart';
export 'ui/views/TIMUIKitChat/TIMUIKitTextField/tim_uikit_text_field.dart';

// export 'ui/views/TIMUIKitGroup/tim_uikit_group_application_list.dart';
export 'package:tencent_im_base/tencent_im_base.dart';
export 'ui/widgets/link_preview/models/link_preview_content.dart';
export 'ui/widgets/column_menu.dart';

// export 'ui/views/TIMUIKitProfile/widget/tim_uikit_profile_userinfo_card/tim_uikit_profile_userinfo_card.dart';
export 'ui/views/TIMUIKitConversation/tim_ui_kit_conversation_total_unread.dart';
export 'data_services/services_locatar.dart';

// Enum
export 'ui/theme/tim_uikit_message_theme.dart';

// Controller
export 'ui/controller/tim_uikit_profile_controller.dart';

// Config
export 'ui/views/TIMUIKitChat/tim_uikit_chat_config.dart';
export 'package:permission_handler/permission_handler.dart';

// Utils
export 'ui/utils/common_utils.dart';
export 'package:tencent_cloud_uikit_core/tencent_cloud_uikit_core.dart';

class TIMUIKitCore {
  static CoreServicesImpl getInstance() {
    setupServiceLocator();
    return serviceLocator<CoreServicesImpl>();
  }

  static V2TIMManager getSDKInstance() {
    return TencentImSDKPlugin.v2TIMManager;
  }

  static initTIMUIKIT() async {
    int sdkappid = 111;
    String userid = "uid";
    String secret = "11";
    String usersig = "sign";
    if (sdkappid == 0 || userid == '' || secret == '' || usersig == '') {
      print("The running parameters are abnormal, please check");
      return;
    }
    await TIMUIKitCore.getInstance().init(
      sdkAppID: sdkappid,
      loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
      listener: V2TimSDKListener(
        onConnectFailed: (code, error) {},
        onConnectSuccess: () {},
        onConnecting: () {},
        onKickedOffline: () {},
        onSelfInfoUpdated: (V2TimUserFullInfo info) {},
        onUserSigExpired: () {},
      ),
    );
    V2TimCallback res = await TIMUIKitCore.getInstance().login(userID: userid, userSig: usersig);
    print("Log in to Tencent Cloud Instant Messaging IM Return：${res.toJson()}");
  }

  int getSDKAPPID() {
    return const int.fromEnvironment('SDK_APPID', defaultValue: 0);
  }

  String getUserID() {
    return const String.fromEnvironment('LOGINUSERID', defaultValue: "10045363");
  }

  String getSecret() {
    return const String.fromEnvironment('SECRET', defaultValue: "");
  }

  String getUsersig() {
    return const String.fromEnvironment('USERSIG', defaultValue: "");
  }
}

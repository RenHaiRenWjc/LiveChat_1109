

import '../../tim_ui_kit/tencent_cloud_chat_uikit.dart';

class ThirdStartUpManager {
  ThirdStartUpManager._thirdStartUpManager();

  factory ThirdStartUpManager() => _instance;

  static late final ThirdStartUpManager _instance = ThirdStartUpManager._thirdStartUpManager();

  void init() {
    TIMUIKitCore.initTIMUIKIT();

  }
}
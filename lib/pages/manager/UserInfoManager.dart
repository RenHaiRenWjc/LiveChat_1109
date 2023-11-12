import 'dart:convert';

import 'package:com.jc.livechat/GlobalConstant/PreferencesKeys.dart';
import 'package:com.jc.livechat/common/SharedPreferencesUtil.dart';

import '../../bean/UserInfo.dart';
import '../../common/LogTools.dart';

class UserInfoManager {
  UserInfoManager._userInfoManager();

  factory UserInfoManager() => _instance;

  static late final UserInfoManager _instance = UserInfoManager._userInfoManager();

  UserInfo? userInfo;

  void saveUserInfo(dynamic userInfoJson) {
    userInfo = UserInfo.fromJson(userInfoJson);
    LogTools.d("UserInfoManager", "saveUserInfo: userInfoJson=${userInfoJson}");

    SharedPreferencesUtil().setStringValue(PreferencesKeys.KEY_USER_INFO, json.encode(userInfo));
  }

  Future<UserInfo?> fetchSpUserInfo() async {
    return SharedPreferencesUtil().getStringValue(PreferencesKeys.KEY_USER_INFO).then((userInfoJson) {
      if (userInfoJson == null) {
        LogTools.i("UserInfoManager", "fetchSpUserInfo: userInfoJson null");
        return null;
      }
      userInfo = UserInfo.fromJson(json.decode(userInfoJson));
      LogTools.d("UserInfoManager", ":userInfo=$userInfo ");
      return userInfo;
    });
  }
}


import 'package:get/get_utils/src/platform/platform.dart';

import '../GlobalConstant/AppConstants.dart';
import '../common/DeviceInfoUtil.dart';
import '../common/LogTools.dart';



class ParamsManager {
  static final ParamsManager _instance = ParamsManager._init();

  factory ParamsManager() => _instance;

  ParamsManager._init();


  Map<String, dynamic> get headersParams => {};

  String channelName = "un-know";

  Map<String, dynamic> awDealParams(Map<String, dynamic> params) {
    var allParams = <String, dynamic>{};
    if (params.isNotEmpty) {
      allParams = Map.from(params);
    }

    allParams["pub_timestamp"] = DateTime.now().millisecondsSinceEpoch.toString();
    // allParams["uuid"] = DeviceInfoUtil.uuid.v1();

    /// 签名 start
    // var encryptParams = Map.from(allParams);
    // encryptParams.remove("ticket");
    // encryptParams.remove("version");
    // encryptParams.remove("pub_ticket");
    // var mStr = "";
    // for (final key in encryptParams.keys.toList()..sort((k1, k2) => k1.compareTo(k2))) {
    //   var str = '$key=${encryptParams[key]}&';
    //   mStr += str;
    // }
    // mStr += 'key=';
    // mStr += NetEnvManager().getParamsKey();
    //
    // allParams["pub_sign"] = md5.convert(const Utf8Encoder().convert(mStr)).toString().toUpperCase();
    //
    // LogTools.d("wjc", "awDealParams pub_sign=${allParams["pub_sign"]}---mStr=$mStr");

    /// 签名 end

    /// 公共参数
    allParams["app"] = AppConstants.APP_NAME_STR;
    // print("channelName ---$channelName");
    var deviceInfo = DeviceInfoUtil.deviceInfo;
    LogTools.d("TAG", ": deviceInfo=$deviceInfo");
    if (GetPlatform.isAndroid) {
      allParams["channel"] = channelName;
      allParams["os"] = "flutter";
      allParams["osVersion"] = deviceInfo?.version.release;
      allParams["deviceId"] = deviceInfo?.androidId;
      allParams["model"] = deviceInfo?.model;
    } else {
      allParams["channel"] = "appstore";
      allParams["os"] = "flutter";
      allParams["osVersion"] = deviceInfo?.systemVersion;
      allParams["deviceId"] = deviceInfo?.identifierForVendor;
      allParams["model"] = deviceInfo?.model;
      // allParams["modelName"] = Global.deviceInfo.localizedModel;
    }
    allParams["appVersion"] = "1.0.0"; //需要另外处理
    return allParams;
  }
}


import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import 'LogTools.dart';


class DeviceInfoUtil {
  static dynamic deviceInfo;

  // static var uuid = const Uuid();

  static dynamic getDeviceInfo() async {
    LogTools.d("TAG", "DeviceInfoUtil:getDeviceInfo deviceInfo=$deviceInfo");
    if (deviceInfo != null) return deviceInfo;
    if (GetPlatform.isAndroid) {
      deviceInfo = await DeviceInfoPlugin().androidInfo;
    } else if (GetPlatform.isIOS) {
      deviceInfo = await DeviceInfoPlugin().iosInfo;
    }
    return deviceInfo;
  }

  // static Future<String> getUUId() async {
  //   String? udid = await FlutterKeychain.get(key: "funplay_wy");
  //   if (udid == null) {
  //     var iosUdid = deviceInfo.identifierForVendor ?? uuid.v1();
  //     await FlutterKeychain.put(key: "funplay_wy", value: iosUdid);
  //     return iosUdid;
  //   }
  //   return udid;
  // }
}

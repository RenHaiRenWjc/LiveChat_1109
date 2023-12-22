import 'package:flutter_plugin_record_plus/flutter_plugin_record.dart';
import 'package:com.jc.livechat/tim_ui_kit/import_proxy/import_proxy.dart';

class NativeImport implements ImportProxy {
  @override
  FlutterPluginRecord? getFlutterPluginRecord() {
    return FlutterPluginRecord();
  }
}

ImportProxy getImportProxy() => NativeImport();

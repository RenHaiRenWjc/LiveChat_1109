import 'package:logger/logger.dart';

class LogTools {
  static LogTools? _instance;

  static late Logger _logger;

  LogTools._internal() {
    _instance = this;
    _logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          colors: true,
          stackTraceBeginIndex: 5,
          errorMethodCount: 8,
          printEmojis: true,
          printTime: true),
    );
  }

  factory LogTools() {
    _instance ??= LogTools._internal();
    return _instance!;
  }

  static void init() {
    LogTools();
  }

  static void v(String tag, dynamic message) {
    _logger.v("Log_WanBan:$message");
  }

  static void d(String tag, dynamic message) {
    _logger.d("Log_WanBan:$message");
  }

  static void i(String tag, dynamic message) {
    _logger.i("Log_WanBan:$message");
  }

  static void w(String tag, dynamic message) {
    _logger.w("Log_WanBan:$message");
  }

  static void e(String tag, dynamic message) {
    _logger.e("Log_WanBan:$message");
  }

  static void wtf(String tag, dynamic message) {
    _logger.wtf("Log_WanBan:$message");
  }
}

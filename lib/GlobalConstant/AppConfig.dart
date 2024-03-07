class AppConfig {
  static final AppConfig _instance = AppConfig._init();

  factory AppConfig() => _instance;

  AppConfig._init() {}

  static const SERVER_HOST_DEBUG = 'https://appfeelu.rcfeelu.com/app/';

  static const SERVER_HOST_RELEASE = 'https://ncapi.yeban888.com';

  static const BASE_URL = DEBUG ? SERVER_HOST_DEBUG : SERVER_HOST_RELEASE;

  static const DEBUG = true;
}

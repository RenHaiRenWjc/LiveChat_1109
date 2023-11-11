import 'package:com.jc.livechat/GlobalConstant/AppConfig.dart';
import 'package:dio/dio.dart';
import 'ServiceResult.dart';
import 'DioCore.dart';

class ServiceHttp {
  static final ServiceHttp _instance = ServiceHttp._internal();

  factory ServiceHttp() => _instance;
  late DioCore coreDio;

  ServiceHttp._internal() {
    final baseOptions = BaseOptions(
      baseUrl: AppConfig.BASE_URL,
      connectTimeout: Duration(milliseconds: 30000),
      receiveTimeout: Duration(milliseconds: 30000),
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    coreDio = DioCore(baseOptions);
  }

  Future<ServiceResult> get(String path, {dynamic params}) async {
    var url = (requestUrl) ? path : '$path';
    try {
      var response = await coreDio.get(url, queryParameters: params);
      return handleResponse(response, url, params: params);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<ServiceResult> post(String path, {dynamic params, Options? customOpt}) async {
    var url = '$path';
    try {
      // customOpt 为空，默认使用 application/x-www-form-urlencoded
      var response =
          await coreDio.post(url, options: customOpt ?? Options(contentType: 'application/x-www-form-urlencoded'), queryParameters: params);
      return handleResponse(response, url, params: params);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  bool _isRequestSuccess(int? statusCode) {
    return (statusCode != null && statusCode >= 200 && statusCode < 300);
  }

  ServiceResult handleResponse(Response response, String url, {dynamic params}) {
    if (!_isRequestSuccess(response.statusCode)) {
      return ServiceResult.failure(errorCode: response.statusCode, errorMsg: response.statusMessage);
    }

    if (response.data["code"] != 200) {
      return ServiceResult.failure(errorCode: response.data["code"], errorMsg: response.data["message"]);
    }

    return ServiceResult.success(response.data["data"]);
  }

  ServiceResult handleException(Exception e) {
    return ServiceResult.failureFromError(coreDio.createErrorEntity(e));
  }
}

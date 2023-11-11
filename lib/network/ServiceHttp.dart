import 'package:com.jc.livechat/GlobalConstant/AppConfig.dart';
import 'package:dio/dio.dart';
import '../common/LogTools.dart';
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

  Future<ServiceResult> get(String url, {dynamic params}) async {
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
      var response = await coreDio.post(url, options: customOpt ?? Options(contentType: 'application/x-www-form-urlencoded'), queryParameters: params);
      return handleResponse(response, url, params: params);
    } on Exception catch (e) {
      return handleException(e);
    }
  }


  ServiceResult handleResponse(Response response, String url, {dynamic params}) {
    // http 状态码判断
    if (!(response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300)) {
      LogTools.i("TAG", ":response.statusCode=${response.statusCode} ");
      return ServiceResult.failure(errorCode: response.statusCode, errorMsg: response.statusMessage);
    }

    if (response.data["errorCode"] != 0) {
      return ServiceResult.failure(errorCode: response.data["errorCode"], errorMsg: response.data["errorMsg"]);
    }

    return ServiceResult.success(response.data["data"]);
  }

  ServiceResult handleException(Exception e) {
    return ServiceResult.failureFromError(coreDio.createErrorEntity(e));
  }
}

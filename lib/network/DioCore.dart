import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../common/LogTools.dart';
import 'ParamsManager.dart';

class DioCore with DioMixin implements Dio {
  @override
  final BaseOptions options;

  // options.queryParameters 初始化可能仅仅传入常规的公参，有些公参可能登录才有值，options.headers同理
  DioCore(this.options) {
    options = options;
    interceptors.add(paramsInterceptor());
    httpClientAdapter = HttpClientAdapter();
  }

  // 拦截器
  InterceptorsWrapper paramsInterceptor() => InterceptorsWrapper(
      onRequest: (options, handler) => requestInterceptor(options, handler),
      onResponse: (response, handler) {
        LogTools.d("TAG", "----响应体, 请求url：${response.requestOptions.path}, data:${response.data}，method=${response.requestOptions.method},参数是：${response.requestOptions.queryParameters}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        LogTools.d("TAG", "onError，请求url：${e.requestOptions.path},method=${e.requestOptions.method},error = ${e.error},message = ${e.message}");
        return handler.next(e);
      });

  // 传入公参、header 参数
  dynamic requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。

    options.queryParameters.addAll(ParamsManager().awDealParams(options.queryParameters));
    options.headers.addAll(ParamsManager().headersParams);
    LogTools.d("TAG", "请求体，---开始请求:url =${options.path}--请求方式：method=${options.method}--params=${options.queryParameters}--headers=${options.headers} ");
    return handler.next(options);
  }

  /*
   * error统一处理
   */
  ErrorEntity createErrorEntity(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          {
            return ErrorEntity(code: -1, message: "请求取消");
          }
        case DioExceptionType.connectionTimeout:
          {
            return ErrorEntity(code: -1, message: "连接超时");
          }
        case DioExceptionType.sendTimeout:
          {
            return ErrorEntity(code: -1, message: "send timeout");
          }
        case DioExceptionType.connectionError:
          {
            return ErrorEntity(code: -1, message: "connection error");
          }
        case DioExceptionType.badCertificate:
          {
            return ErrorEntity(code: -1, message: "bad certificate");
          }

        case DioExceptionType.receiveTimeout:
          {
            return ErrorEntity(code: -1, message: "receive timeout");
          }
        case DioExceptionType.badResponse:
          {
            try {
              int? errCode = error.response?.statusCode;
              if (errCode == null) {
                return ErrorEntity(code: -2, message: error.message);
              }
              switch (errCode) {
                case 400:
                  {
                    return ErrorEntity(code: errCode, message: "请求语法错误");
                  }

                case 401:
                  {
                    return ErrorEntity(code: errCode, message: "没有权限");
                  }

                case 403:
                  {
                    return ErrorEntity(code: errCode, message: "服务器拒绝执行");
                  }
                case 404:
                  {
                    return ErrorEntity(code: errCode, message: "无法连接服务器");
                  }
                case 405:
                  {
                    return ErrorEntity(code: errCode, message: "请求方法被禁止");
                  }
                case 500:
                  {
                    return ErrorEntity(code: errCode, message: "服务器内部错误");
                  }
                case 502:
                  {
                    return ErrorEntity(code: errCode, message: "无效的请求");
                  }
                case 503:
                  {
                    return ErrorEntity(code: errCode, message: "服务器挂了");
                  }
                case 505:
                  {
                    return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
                  }
                default:
                  {
                    return ErrorEntity(code: errCode, message: error.response?.data);
                  }
              }
            } on Exception catch (_) {
              return ErrorEntity(code: -3, message: "未知错误");
            }
          }
        default:
          {
            return ErrorEntity(code: -4, message: error.message);
          }
      }
    } else {
      return ErrorEntity(code: -5, message: error.toString());
    }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code;
  String? message;

  ErrorEntity({required this.code, this.message});

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}

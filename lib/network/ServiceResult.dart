import 'DioCore.dart';

class ServiceResult {
  late bool ok;
  dynamic data;
  ErrorEntity? errorEntity;

  ServiceResult.success(this.data) {
    ok = true;
  }

  ServiceResult.failureFromError(this.errorEntity) {
    ok = false;
  }

  ServiceResult.failure({String? errorMsg, int? errorCode}) {
    errorEntity = ErrorEntity(code: errorCode ?? -1, message: errorMsg);
    ok = false;
  }
}

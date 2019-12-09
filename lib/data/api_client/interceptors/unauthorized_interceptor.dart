import 'package:com_cingulo_sample/data/api_client/errors/unauthorized_error.dart';
import 'package:dio/dio.dart';

class UnauthorizedInterceptor extends Interceptor {
  @override
  Future onError(DioError error) async {
    if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
      return UnauthorizedError();
    }
    return null;
  }
}

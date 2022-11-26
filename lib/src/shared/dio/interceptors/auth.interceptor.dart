import 'package:dio/dio.dart';
import 'package:get/get.dart' as buid;

import '../../../modules/auth/token/domain/itoken.usecase.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final ITokenUsecase tokenUsecase;

  AuthInterceptor(this.tokenUsecase);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      buid.Get.offAllNamed('/login');
    }
    handler.next(err);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final result = await tokenUsecase.getToken();
    result.fold((l) => handler.next(options), (r) {
      options.headers['Authorization'] = 'Bearer ${r.token}';
      handler.next(options);
    });
  }
}

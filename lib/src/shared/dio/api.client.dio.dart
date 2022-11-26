import 'package:app_comanda/src/modules/auth/token/domain/itoken.usecase.dart';

import 'client.dio.dart';
import 'interceptors/auth.interceptor.dart';

class ApiClientDio extends ClientDio {
  final ITokenUsecase userUsecase;

  ApiClientDio({required this.userUsecase}) {
    client.interceptors.add(AuthInterceptor(userUsecase));
  }
}
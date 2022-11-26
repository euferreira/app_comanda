import 'package:app_comanda/src/modules/auth/token/domain/itoken.usecase.dart';
import 'package:get/get.dart';

import '../modules/auth/token/domain/usecase/token.usecase.dart';
import '../modules/auth/token/infra/datasource/token.hive.datasource.dart';
import '../modules/auth/token/infra/repository/token.repository.dart';
import '../shared/dio/api.client.dio.dart';
import '../themes/domain/usecase/theme.usecase.dart';
import '../themes/infra/datasource/theme.datasource.dart';
import '../themes/infra/repository/theme.repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    final themeDatasource = ThemeDatasource();
    final themeRepository = ThemeRepository(themeDatasource);
    Get.lazyPut<ThemeUsecase>(() => ThemeUsecase(themeRepository), fenix: true);

    final tokenHiveDatasource = TokenHiveDatasource();
    final tokenRepository = TokenRepository(dataSource: tokenHiveDatasource);
    Get.lazyPut<ITokenUsecase>(() => TokenUsecase(repository: tokenRepository), fenix: true);

    Get.lazyPut<ApiClientDio>(() => ApiClientDio(userUsecase: Get.find<ITokenUsecase>()), fenix: true);
  }
}
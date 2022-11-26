import 'package:app_comanda/src/themes/app.theme.dart';
import 'package:app_comanda/src/themes/domain/usecase/theme.usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/infra/datasource/theme.datasource.dart';
import '../themes/infra/repository/theme.repository.dart';

class AppController extends GetxController {
  late final ThemeUsecase themeUsecase;

  @override
  void onInit() {
    super.onInit();
    findThemeInstance();
  }

  void findThemeInstance() {
    try {
      themeUsecase = Get.find<ThemeUsecase>();
    } catch (e) {
      final themeDatasource = ThemeDatasource();
      final themeRepository = ThemeRepository(themeDatasource);
      Get.lazyPut<ThemeUsecase>(() => ThemeUsecase(themeRepository),
          fenix: true);
      themeUsecase = Get.find<ThemeUsecase>();
    }
  }

  ThemeData getThemeData(BuildContext context) {
    switch (buscarTema()) {
      case ThemeMode.light:
        return AppTheme.lightTheme;

      case ThemeMode.dark:
        return AppTheme.darkTheme;

      default:
        return context.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    }
  }

  ThemeMode buscarTema() => themeUsecase.getTheme().themeMode;
}

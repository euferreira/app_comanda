import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../themes/app.theme.dart';
import 'app.binding.dart';
import 'app.controller.dart';
import 'app.module.dart';

class ComandasApp extends GetView<AppController> {
  const ComandasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Comandas',
      theme: controller.getThemeData(context),
      darkTheme: AppTheme.darkTheme,
      themeMode: controller.buscarTema(),
      enableLog: kDebugMode,
      debugShowCheckedModeBanner: kDebugMode,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialBinding: AppBinding(),
      getPages: AppModule().routes,
    );
  }
}

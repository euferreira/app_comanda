import 'package:app_comanda/src/core/app.module.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'application/splash.binding.dart';
import 'application/splash.page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
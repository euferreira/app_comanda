import 'package:app_comanda/src/modules/auth/auth.module.dart';
import 'package:app_comanda/src/modules/splash/splash.module.dart';
import 'package:get/get.dart';

abstract class Module {
  late List<GetPage> routes;
}

class Routes {
  static Routes get to => Routes();

  List<T> list<T>(Iterable<Iterable<T>> list) =>
      [for (var sublist in list) ...sublist];
}

class AppModule implements Module {
  @override
  List<GetPage> routes = Routes.to.list([
    AuthModule().routes,
    SplashModule().routes,
  ]);
}

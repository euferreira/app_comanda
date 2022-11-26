import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    //Get.offAllNamed('/home');
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alerts {
  static void alertError(String message, {String title = 'Erro'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  static void alertSuccess(String message, {String title = 'Sucesso'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      colorText: Colors.white,
    );
  }
}

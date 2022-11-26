import 'package:app_comanda/src/core/app.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/app.controller.dart';
import 'src/shared/hive/hive.config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<AppController>(AppController(), permanent: true);

  await dotenv.load();
  await Hive.initFlutter();
  await HiveConfig().init();

  runApp(const ComandasApp());
}

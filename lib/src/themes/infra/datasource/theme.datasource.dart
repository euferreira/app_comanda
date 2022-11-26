import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/theme.entity.dart';
import '../itheme.datasource.dart';

class ThemeDatasource implements IThemeDataSource {
  @override
  ThemeMode getTheme() {
    try {
      final box = Hive.box<String>('theme');
      final theme = box.get('theme');
      switch (theme) {
        case 'ThemeMode.light':
          return ThemeMode.light;
        case 'ThemeMode.dark':
          return ThemeMode.dark;
        default:
          return ThemeMode.light;
      }
    }
    catch (e) {
      throw Fail('Hive errors: ${e.toString()}');
    }
  }

  @override
  Future<void> setTheme(ThemeEntity param) async {
    try {
      final box = Hive.box<String>('theme');
      box.put('theme', param.themeMode.toString());
    }
    catch (e) {
      throw Fail('Hive errors: ${e.toString()}');
    }
  }
}
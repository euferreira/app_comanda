import 'package:flutter/material.dart';

import '../domain/entity/theme.entity.dart';

abstract class IThemeDataSource {
  ThemeMode getTheme();
  Future<void> setTheme(ThemeEntity param);
}
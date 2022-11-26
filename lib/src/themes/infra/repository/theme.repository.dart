import 'package:flutter/material.dart';

import '../../domain/entity/theme.entity.dart';
import '../../domain/itheme.repository.dart';
import '../itheme.datasource.dart';

class ThemeRepository implements IThemeRepository {
  final IThemeDataSource dataSource;

  ThemeRepository(this.dataSource);

  @override
  ThemeEntity getTheme() {
    try {
      final theme = dataSource.getTheme();
      return ThemeEntity(themeMode: theme);
    }
    catch (e) {
      return ThemeEntity(themeMode: ThemeMode.light);
    }
  }

  @override
  Future<void> saveTheme(ThemeEntity theme) {
    return dataSource.setTheme(theme);
  }
}
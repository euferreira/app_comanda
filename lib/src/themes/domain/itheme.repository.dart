import 'entity/theme.entity.dart';

abstract class IThemeRepository {
  ThemeEntity getTheme();
  Future<void> saveTheme(ThemeEntity theme);
}
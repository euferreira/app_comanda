import 'entity/theme.entity.dart';

abstract class IThemeUsecase {
  ThemeEntity getTheme();

  Future<void> setTheme(ThemeEntity param);
}
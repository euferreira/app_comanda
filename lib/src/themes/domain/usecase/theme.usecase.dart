import '../entity/theme.entity.dart';
import '../itheme.repository.dart';
import '../itheme.usecase.dart';

class ThemeUsecase implements IThemeUsecase {
  final IThemeRepository repository;

  ThemeUsecase(this.repository);

  @override
  ThemeEntity getTheme() => repository.getTheme();

  @override
  Future<void> setTheme(ThemeEntity param) async => await repository.saveTheme(param);
}
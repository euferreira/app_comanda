import 'entity/token.entity.dart';

abstract class ITokenRepository {
  Future<void> saveToken(String token);

  Future<TokenEntity> getToken();
}

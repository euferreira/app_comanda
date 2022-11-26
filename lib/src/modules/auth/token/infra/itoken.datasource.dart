import 'package:app_comanda/src/modules/auth/token/domain/entity/token.entity.dart';

abstract class ITokenDataSource {
  Future<TokenEntity> getToken();
  
  Future<void> saveToken(TokenParams params);
}
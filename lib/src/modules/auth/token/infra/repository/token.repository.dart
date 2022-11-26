import 'package:app_comanda/src/modules/auth/token/domain/entity/token.entity.dart';
import 'package:app_comanda/src/modules/auth/token/domain/itoken.repository.dart';
import 'package:app_comanda/src/modules/auth/token/infra/itoken.datasource.dart';

class TokenRepository implements ITokenRepository {
  final ITokenDataSource dataSource;

  TokenRepository({required this.dataSource});

  @override
  Future<TokenEntity> getToken() async {
    return await dataSource.getToken();
  }

  @override
  Future<void> saveToken(String token) {
    return dataSource.saveToken(TokenParams(token: token));
  }

}
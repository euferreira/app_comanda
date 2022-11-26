import 'package:app_comanda/src/modules/auth/token/domain/entity/token.entity.dart';
import 'package:app_comanda/src/modules/auth/token/infra/itoken.datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../../shared/hive/models/token.hive.dart';
import '../model/token.model.dart';

class TokenHiveDatasource implements ITokenDataSource {
  @override
  Future<TokenEntity> getToken() async {
    try {
      final box = Hive.box<TokenHive>('token');
      final token = box.get('token');
      if (token != null) {
        return TokenModel.fromHive(token);
      }
      throw Fail('Token não encontrado');
    }
    catch (e) {
      throw Fail(e);
    }
  }

  @override
  Future<void> saveToken(TokenParams params) async {
    try {
      final box = Hive.box<TokenHive>('token');
      final token = TokenHive(token: params.token!);
      await box.put('token', token);
    }
    catch (e) {
      throw Fail(e);
    }
  }
}
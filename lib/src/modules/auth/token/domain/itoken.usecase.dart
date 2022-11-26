import 'package:app_comanda/src/modules/auth/token/domain/entity/token.entity.dart';
import 'package:dartz/dartz.dart';

abstract class ITokenUsecase {
  Future<Either<Fail, TokenEntity>> getToken();

  Future<Either<Fail, void>> setToken(TokenParams params);
}
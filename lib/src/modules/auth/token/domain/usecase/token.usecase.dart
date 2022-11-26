import 'package:app_comanda/src/modules/auth/token/domain/entity/token.entity.dart';
import 'package:app_comanda/src/modules/auth/token/domain/itoken.repository.dart';
import 'package:app_comanda/src/modules/auth/token/domain/itoken.usecase.dart';
import 'package:dartz/dartz.dart';

class TokenUsecase implements ITokenUsecase {
  final ITokenRepository repository;

  TokenUsecase({required this.repository});

  @override
  Future<Either<Fail, TokenEntity>> getToken() async {
    try {
      final result = await repository.getToken();
      return result.token != null ? Right(result) : Left(Fail('Token não encontrado'));
    } 
    catch (e) {
      return Left(Fail("Erro ao buscar token"));
    }
  }

  @override
  Future<Either<Fail, void>> setToken(TokenParams params) async {
    try {
      if (params.token == null || params.token!.isEmpty) {
        return Left(Fail("Token não pode ser vazio"));
      }
      final result = await repository.saveToken(params.token!);
      return Right(result);
    } 
    catch (e) {
      return Left(Fail("Erro ao salvar token"));
    }
  }
}
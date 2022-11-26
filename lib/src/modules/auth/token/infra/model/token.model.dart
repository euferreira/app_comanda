import 'package:app_comanda/src/modules/auth/token/domain/entity/token.entity.dart';

import '../../../../../shared/hive/models/token.hive.dart';

class TokenModel extends TokenEntity {
  TokenModel({
    required super.token,
  });

  factory TokenModel.fromHive(TokenHive data) {
    return TokenModel(
      token: data.token,
    );
  }
}
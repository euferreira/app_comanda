import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TokenHive extends HiveObject {
  @HiveField(0)
  final String token;

  TokenHive({
    required this.token,
  });
}
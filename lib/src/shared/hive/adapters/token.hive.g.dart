// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

import 'package:app_comanda/src/shared/hive/models/token.hive.dart';
import 'package:hive/hive.dart';

class TokenHiveAdapter extends TypeAdapter<TokenHive> {
  @override
  final int typeId = 0;

  @override
  TokenHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenHive(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TokenHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

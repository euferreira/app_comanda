import 'dart:convert';

import 'package:app_comanda/src/shared/hive/adapters/token.hive.g.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import 'models/token.hive.dart';

abstract class IHiveConfig {
  void init();

  void collections();

  void adapters();
}

class HiveConfig implements IHiveConfig {
  @override
  Future<void> adapters() async {
    Hive.registerAdapter(TokenHiveAdapter());
  }

  @override
  Future<void> collections() async {
    const secureStorage = FlutterSecureStorage();
    final secureKey = await secureStorage.read(key: 'SECURE_STORAGE_KEY');

    if (secureKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'SECURE_STORAGE_KEY', value: base64UrlEncode(key));
    }

    final key = await secureStorage.read(key: 'SECURE_STORAGE_KEY');
    final encryptionKey = base64Url.decode(key!);
    final cipher = HiveAesCipher(encryptionKey);

    await Hive.openBox<String>('theme');
    await Hive.openBox<TokenHive>('token', encryptionCipher: cipher);
  }

  @override
  Future<void> init() async {
    await adapters();
    await collections();
  }
}
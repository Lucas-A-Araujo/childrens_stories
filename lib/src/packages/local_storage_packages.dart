import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStoragePackages {
  final _storage = const FlutterSecureStorage();

  Future<void> writeLocal({required String key, String? value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readLocal({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteLocal({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAllLocal() async {
    await _storage.deleteAll();
  }
}

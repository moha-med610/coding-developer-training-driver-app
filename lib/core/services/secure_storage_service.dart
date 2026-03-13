import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Usage
/// await SecureStorageService().write(key: "key", value: "value");
/// await SecureStorageService().read(key: "key");
/// await SecureStorageService().delete(key: "key");
/// await SecureStorageService().deleteAll();
class SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Write
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  /// Read
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  /// Delete
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  /// Delete All
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();

  Future<void> clearAll();
}

class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageServiceImpl(this._secureStorage);

  // Highly recommended Android configuration to isolate encrypted files
  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  // iOS configuration determining accessibility rules
  IOSOptions _getIOSOptions() =>
      IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device);

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(
      key: 'auth_token',
      value: token,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(
      key: 'auth_token',
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  @override
  Future<void> deleteToken() async {
    await _secureStorage.delete(
      key: 'auth_token',
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  @override
  Future<void> clearAll() async {
    await _secureStorage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }
}

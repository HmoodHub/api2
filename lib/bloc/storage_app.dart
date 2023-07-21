import 'package:api2/model/storage_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageApp {
  final _storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> writeSecureData(StorageModel newItem) async {
    await _storage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }

  readSecureData(String key) async {
    var readData =
        await _storage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> deleteAllSecureData() async {
    await _storage.deleteAll(aOptions: _getAndroidOptions());
  }
}

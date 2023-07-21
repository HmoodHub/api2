import 'package:get_storage/get_storage.dart';




class StorageApp{
  final _storage = GetStorage();
  saveData(dynamic value, String key)async{
    await _storage.write(key, value);
  }
  dynamic dataSave(String key){
    return  _storage.read(key);
  }

}
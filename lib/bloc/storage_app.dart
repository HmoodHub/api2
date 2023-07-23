
import 'package:shared_preferences/shared_preferences.dart';

class StorageApp {

   SharedPreferences? _pref;

   //// SET DATA SHEARED PREF
   setDataString(String key, String value)async{
     _pref = await SharedPreferences.getInstance();
     _pref?.setString(key, value);
   }
   setDataBool(String key, bool value)async{
     _pref = await SharedPreferences.getInstance();
     _pref?.setBool(key, value);
   }
   setDataDouble(String key, double value)async{
     _pref = await SharedPreferences.getInstance();
     _pref?.setDouble(key, value);
   }
   setDataInt(String key, int value)async{
     _pref = await SharedPreferences.getInstance();
     _pref?.setInt(key, value);
   }
   setDataListOfString(String key, List<String> value)async{
     _pref = await SharedPreferences.getInstance();
     _pref?.setStringList(key, value);
   }

   setData(String key, dynamic value)async{
     _pref = await SharedPreferences.getInstance();
     if (value is int) _pref?.setInt(key, value);
     if (value is String) _pref?.setString(key, value);
     if (value is double) _pref?.setDouble(key, value);
     if (value is bool) _pref?.setBool(key, value);
     if (value is List<String>) _pref?.setStringList(key, value);
   }



   //// GET DATA SHEARED PREF
   getDataString(String key)async{
     _pref = await SharedPreferences.getInstance();
     _pref?.get(key);
   }

}

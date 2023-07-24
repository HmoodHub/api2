import 'package:api2/model/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum PrfKeys{
  loggedIn, token, email, fullName, gender
}
class SharedPrfController{

  // THIS IS SINGLTONE CLASS
  SharedPrfController._();
  static final SharedPrfController _instance =SharedPrfController._();
  late SharedPreferences _sharedPreferences;
  factory SharedPrfController(){
    return _instance;
  }
  Future<void> initPref()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> save({required Student student})async{
    _sharedPreferences.setBool(PrfKeys.loggedIn.toString(), true);
    _sharedPreferences.setString(PrfKeys.gender.toString(), student.gender);
    _sharedPreferences.setString(PrfKeys.email.toString(), student.email);
    _sharedPreferences.setString(PrfKeys.fullName.toString(), student.fullName);
    _sharedPreferences.setString(PrfKeys.token.toString(), 'Bearer ${student.token}');

  }

  bool get loggedIn => _sharedPreferences.getBool(PrfKeys.loggedIn.toString()) ?? false ;
  String get tokenApp => _sharedPreferences.getString(PrfKeys.token.toString()) ?? "No Token";
  Future<bool> clear()async{
   return await _sharedPreferences.clear();
  }
}
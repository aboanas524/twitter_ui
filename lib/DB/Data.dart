import 'package:shared_preferences/shared_preferences.dart';

class Data{

  static late SharedPreferences prefs;
  static Future<void> getPrefs ()async{
    prefs = await SharedPreferences.getInstance();
  }
}
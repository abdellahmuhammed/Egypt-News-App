import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedHelper {
  static SharedPreferences _sharedPreferences;

  static init() async {
     _sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> PutData({@required String key, @required bool value}) async {
    return await _sharedPreferences.setBool(key, value);
  }

  static bool GetData({@required String key}) {
    _sharedPreferences.getBool(key);
  }
}

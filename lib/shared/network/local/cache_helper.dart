import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences;
  static init() async
  {
    sharedPreferences=await SharedPreferences.getInstance();
  }


  static Future<bool?> savaData({
    required String key,
    required var  value,
})async
  {
    if(value is String)return await sharedPreferences?.setString(key, value);
    if(value is int)return await sharedPreferences?.setInt(key, value);
    if(value is bool)return await sharedPreferences?.setBool(key, value);
    return await sharedPreferences?.setDouble(key, value);
  }
  static dynamic getAllData({
    required String key,
  })
  {
    return sharedPreferences?.get(key);
  }

  static Future<bool?> removedata ( {required String key,})async{
    return await sharedPreferences?.remove(key);
  }

}
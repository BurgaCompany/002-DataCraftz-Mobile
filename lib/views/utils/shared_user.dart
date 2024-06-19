import 'dart:convert';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const String userKey = 'user';
  static const String tokenKey = 'token';
  static const String roleKey = 'role';

  static Future<void> setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = userModel.toJson();
    String stringUser = jsonEncode(userMap);

    await prefs.setString(userKey, stringUser);
    await prefs.setString(tokenKey, userModel.token ?? '');
    await prefs.setString(roleKey, userModel.role ?? '');
  }

  static Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString(userKey);
    if (userString != null) {
      Map<String, dynamic> userMap = jsonDecode(userString);
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  static Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
    await prefs.remove(tokenKey);
    await prefs.remove(roleKey);
  }
}

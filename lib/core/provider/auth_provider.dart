import 'dart:convert';

import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  bool isLoading = false;

  Future<void> checkUser() async {
    _userModel = await Session.getUser();
    notifyListeners();
  }

  Future<dynamic> authLogin(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient().post(
        ApiUrl.login,
        body: {
          'email': email,
          'password': password,
        },
      );
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        isLoading = false;
        _userModel = UserModel.fromJson(responseData);

        await Session.setUser(_userModel!);
        notifyListeners();
        return responseData;
      } else {
        notifyListeners();
        return responseData;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future authRegister(
    String name,
    String email,
    String password,
    String address,
    String phone,
  ) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient().post(
        ApiUrl.register,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'address': address,
          'phone_number': phone,
        },
      );

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return response;
      } else {
        notifyListeners();
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  String? _userId;
  bool isLoading = false;

  Future<void> loadUser() async {
    await Session.getUser().then((value) {
      _userId = value!.result!.id.toString();
    });
  }

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
        isLoading = false;
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
        isLoading = false;
        notifyListeners();
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future authEdit(
      String password, String email, String phone, String address) async {
    await loadUser();
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient().post(
        '${ApiUrl.editProfile}?id=$_userId',
        body: {
          'password': password,
          'email': email,
          'phone': phone,
          'address': address,
        },
      );
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return response;
      } else {
        isLoading = false;
        notifyListeners();
        throw Exception('Failed to edit profile');
      }
    } catch (e) {
      rethrow;
    }
  }
}

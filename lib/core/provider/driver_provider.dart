import 'dart:convert';

import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:datacraftz_mobile/core/model/driver_schedule_model.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:flutter/material.dart';

class DriverProvider extends ChangeNotifier {
  List<DataScheduleDriver> _dataScheduleDriver = [];
  List<DataScheduleDriver> get dataScheduleDriver => _dataScheduleDriver;
  String? _userId;
  bool isLoading = false;

  Future<void> loadUser() async {
    await Session.getUser().then((value) {
      _userId = value!.result!.id.toString();
    });
  }

  Future<List<DataScheduleDriver>> getListSchedule() async {
    await loadUser();
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient()
          .get('${ApiUrl.checkScheduleDriver}?driver_id=$_userId');
      if (response.statusCode == 200) {
        isLoading = false;
        final responseData =
            json.decode(response.body)['data_schedule_driver'] as List<dynamic>;
        _dataScheduleDriver =
            responseData.map((e) => DataScheduleDriver.fromJson(e)).toList();
        notifyListeners();
        return _dataScheduleDriver;
      } else if (response.statusCode == 400) {
        isLoading = false;
        _dataScheduleDriver = [];
        notifyListeners();
        return _dataScheduleDriver;
      } else {
        isLoading = false;
        throw Exception('Failed to load schedule driver');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future updateStatusBus(String id, String status) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient().post(ApiUrl.updateStatusBus, body: {
        'bus_id': id,
        'status': status,
      });
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return response;
      } else {
        isLoading = false;
        throw Exception('Failed to update status bus');
      }
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:datacraftz_mobile/core/model/schedule_station_model.dart';
import 'package:datacraftz_mobile/core/model/station_model.dart';
import 'package:flutter/material.dart';

class StationProvider extends ChangeNotifier {
  List<DataStation>? _dataStation;
  List<DataStation>? _filteredDataStation;
  List<DataStation>? get dataStation => _filteredDataStation;

  List<DataSchedule>? _dataSchedule;
  List<DataSchedule>? get dataSchedule => _dataSchedule;

  bool isLoading = false;

  Future<List<DataStation>> getListStation() async {
    isLoading = true;
    try {
      final response = await ApiClient().get(ApiUrl.station);
      if (response.statusCode == 200) {
        isLoading = false;
        final responseData =
            json.decode(response.body)['data_station'] as List<dynamic>;
        _dataStation =
            responseData.map((e) => DataStation.fromJson(e)).toList();
        _filteredDataStation = _dataStation;
        notifyListeners();
        return _dataStation!;
      } else {
        isLoading = false;
        throw Exception('Failed to load data');
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  void searchStation(String query) {
    if (query.isEmpty) {
      _filteredDataStation = _dataStation;
    } else {
      _filteredDataStation = _dataStation
          ?.where((station) =>
              station.name!.toLowerCase().contains(query.toLowerCase()) ||
              station.codeName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<List<DataSchedule>> searchSchedule(
      String toStation, String fromStation, String date) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient().get(
          '${ApiUrl.stationScheduleSearch}?from_station=$fromStation&to_station=$toStation&date=$date');
      if (response.statusCode == 200) {
        isLoading = false;
        final responseData =
            json.decode(response.body)['data_schedule'] as List<dynamic>;

        _dataSchedule =
            responseData.map((e) => DataSchedule.fromJson(e)).toList();
        notifyListeners();
        return _dataSchedule!;
      } else {
        isLoading = false;
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}

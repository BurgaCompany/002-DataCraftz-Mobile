import 'dart:convert';

import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:datacraftz_mobile/core/model/history_done_model.dart';
import 'package:datacraftz_mobile/core/model/history_goon_model.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserScheduleProvider extends ChangeNotifier {
  List<DataReservationGoon>? _historyGoon;
  List<DataReservationGoon>? get historyGoon => _historyGoon;
  List<DataReservationDone>? _historyDone;
  List<DataReservationDone>? get historyDone => _historyDone;
  String? _userId;
  bool isLoading = false;

  Future<void> loadUser() async {
    await Session.getUser().then((value) {
      _userId = value!.result!.id.toString();
    });
  }

  Future<List<DataReservationGoon>> getHistoryGoon() async {
    isLoading = true;
    await loadUser();
    notifyListeners();
    try {
      final response =
          await ApiClient().get('${ApiUrl.historyTicketGoon}?id=$_userId');
      if (response.statusCode == 200) {
        isLoading = false;
        final responseData =
            json.decode(response.body)['data_reservation'] as List<dynamic>;
        _historyGoon =
            responseData.map((e) => DataReservationGoon.fromJson(e)).toList();
        notifyListeners();
        return _historyGoon!;
      } else {
        isLoading = false;
        throw Exception('Failed to load history goon');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DataReservationDone>> getHistoryDone() async {
    isLoading = true;
    await loadUser();
    notifyListeners();
    try {
      final response =
          await ApiClient().get('${ApiUrl.historyTicketDone}?id=$_userId');
      if (response.statusCode == 200) {
        isLoading = false;
        final responseData =
            json.decode(response.body)['data_reservation'] as List<dynamic>;
        Logger().t(responseData);
        _historyDone =
            responseData.map((e) => DataReservationDone.fromJson(e)).toList();
        notifyListeners();
        return _historyDone!;
      } else {
        isLoading = false;
        throw Exception('Failed to load history done');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future bookedTicket(
      String orderId,
      String totalPrice,
      String firstName,
      String lastName,
      String userId,
      String busId,
      String scheduleId,
      String ticketBooked,
      String dateDeparture) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiClient().post(
        ApiUrl.bookedTicket,
        body: {
          'order_id': orderId,
          'total_price': totalPrice,
          'first_name': firstName,
          'last_name': lastName,
          'user_id': userId,
          'bus_id': busId,
          'schedule_id': scheduleId,
          'tickets_booked': ticketBooked,
          'date_departure': dateDeparture,
        },
      );
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return response;
      } else {
        throw Exception('Failed to booked ticket');
      }
    } catch (e) {
      rethrow;
    }
  }
}

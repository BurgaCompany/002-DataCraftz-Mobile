import 'dart:convert';

import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:datacraftz_mobile/core/model/reservation_check_model.dart';
import 'package:flutter/material.dart';

class ConductorProvider extends ChangeNotifier {
  DataReservationCheck? _dataReservationCheck;
  DataReservationCheck? get dataReservationCheck => _dataReservationCheck;

  bool isLoading = false;

  Future checkTicket(String orderId) async {
    try {
      final response =
          await ApiClient().get('${ApiUrl.checkTicket}?order_id=$orderId');
      if (response.statusCode == 200) {
        final responseData =
            json.decode(response.body)['data_reservation_check'];
        _dataReservationCheck = DataReservationCheck.fromJson(responseData);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future updateTicket(String orderId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response =
          await ApiClient().get('${ApiUrl.updateTicket}?order_id=$orderId');
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return response;
      } else {
        isLoading = false;
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}

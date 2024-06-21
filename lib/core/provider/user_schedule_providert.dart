
import 'package:datacraftz_mobile/constant/api.dart';
import 'package:datacraftz_mobile/constant/api_client.dart';
import 'package:flutter/material.dart';

class UserScheduleProvider extends ChangeNotifier {
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

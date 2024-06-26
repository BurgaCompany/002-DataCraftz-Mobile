class ApiUrl {
  //Authentication
  static const String baseUrl = "https://transgo.burga.web.id/api";
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";
  static const String editProfile = "$baseUrl/auth/edit";
  //Station
  static const String station = "$baseUrl/station";
  static const String stationScheduleSearch = "$baseUrl/schedules/find";
  //Booked Ticket
  static const String bookedTicket = "$baseUrl/midtrans-payment-gateway";
  //History Ticket
  static const String historyTicketGoon = "$baseUrl/reservation-goon";
  static const String historyTicketDone = "$baseUrl/reservation-history";
  static const String ratingDriver = "$baseUrl/review-rating";
  //Conductor
  static const String checkTicket = "$baseUrl/scan/conductor";
  static const String updateTicket = "$baseUrl/check/update";
  //Driver
  static const String checkScheduleDriver = '$baseUrl/driver/list';
  static const String updateStatusBus = '$baseUrl/driver/check';
}

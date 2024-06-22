class ApiUrl {
  //Authentication
  static const String baseUrl = "https://transgo.burga.web.id/api";
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";
  //Station
  static const String station = "$baseUrl/station";
  static const String stationScheduleSearch = "$baseUrl/schedules/find";

  //Booked Ticket
  static const String bookedTicket = "$baseUrl/midtrans-payment-gateway";
  //History Ticket
  static const String historyTicketGoon = "$baseUrl/reservation-goon";
  static const String historyTicketDone = "$baseUrl/reservation-history";
}

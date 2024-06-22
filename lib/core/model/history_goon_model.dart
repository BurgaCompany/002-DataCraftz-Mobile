import 'dart:convert';

class NowScheduleStationModel {
  int? statusCode;
  String? message;
  List<DataReservationGoon>? dataReservation;

  NowScheduleStationModel({
    this.statusCode,
    this.message,
    this.dataReservation,
  });

  NowScheduleStationModel copyWith({
    int? statusCode,
    String? message,
    List<DataReservationGoon>? dataReservation,
  }) =>
      NowScheduleStationModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        dataReservation: dataReservation ?? this.dataReservation,
      );

  factory NowScheduleStationModel.fromRawJson(String str) =>
      NowScheduleStationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NowScheduleStationModel.fromJson(Map<String, dynamic> json) =>
      NowScheduleStationModel(
        statusCode: json["statusCode"],
        message: json["message"],
        dataReservation: json["data_reservation"] == null
            ? []
            : List<DataReservationGoon>.from(json["data_reservation"]!
                .map((x) => DataReservationGoon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data_reservation": dataReservation == null
            ? []
            : List<dynamic>.from(dataReservation!.map((x) => x.toJson())),
      };
}

class DataReservationGoon {
  String? orderId;
  String? userName;
  String? scheduleFromStation;
  String? scheduleToStation;
  String? scheduleFromStationCodeName;
  String? scheduleToStationCodeName;
  String? schedulePwt;
  String? busClass;
  int? schedulePrice;
  String? scheduleTimeStart;
  String? scheduleTimeArrive;
  String? licensePlateNumber;
  int? ticketsBooked;
  DateTime? dateDeparture;
  String? status;
  String? statusBus;

  DataReservationGoon({
    this.orderId,
    this.userName,
    this.scheduleFromStation,
    this.scheduleToStation,
    this.scheduleFromStationCodeName,
    this.scheduleToStationCodeName,
    this.schedulePwt,
    this.busClass,
    this.schedulePrice,
    this.scheduleTimeStart,
    this.scheduleTimeArrive,
    this.licensePlateNumber,
    this.ticketsBooked,
    this.dateDeparture,
    this.status,
    this.statusBus,
  });

  DataReservationGoon copyWith({
    String? orderId,
    String? userName,
    String? scheduleFromStation,
    String? scheduleToStation,
    String? scheduleFromStationCodeName,
    String? scheduleToStationCodeName,
    String? schedulePwt,
    String? busClass,
    int? schedulePrice,
    String? scheduleTimeStart,
    String? scheduleTimeArrive,
    String? licensePlateNumber,
    int? ticketsBooked,
    DateTime? dateDeparture,
    String? status,
    String? statusBus,
  }) =>
      DataReservationGoon(
        orderId: orderId ?? this.orderId,
        userName: userName ?? this.userName,
        scheduleFromStation: scheduleFromStation ?? this.scheduleFromStation,
        scheduleToStation: scheduleToStation ?? this.scheduleToStation,
        scheduleFromStationCodeName:
            scheduleFromStationCodeName ?? this.scheduleFromStationCodeName,
        scheduleToStationCodeName:
            scheduleToStationCodeName ?? this.scheduleToStationCodeName,
        schedulePwt: schedulePwt ?? this.schedulePwt,
        busClass: busClass ?? this.busClass,
        schedulePrice: schedulePrice ?? this.schedulePrice,
        scheduleTimeStart: scheduleTimeStart ?? this.scheduleTimeStart,
        scheduleTimeArrive: scheduleTimeArrive ?? this.scheduleTimeArrive,
        licensePlateNumber: licensePlateNumber ?? this.licensePlateNumber,
        ticketsBooked: ticketsBooked ?? this.ticketsBooked,
        dateDeparture: dateDeparture ?? this.dateDeparture,
        status: status ?? this.status,
        statusBus: statusBus ?? this.statusBus,
      );

  factory DataReservationGoon.fromRawJson(String str) =>
      DataReservationGoon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataReservationGoon.fromJson(Map<String, dynamic> json) =>
      DataReservationGoon(
        orderId: json["order_id"],
        userName: json["user_name"],
        scheduleFromStation: json["schedule_from_station"],
        scheduleToStation: json["schedule_to_station"],
        scheduleFromStationCodeName: json["schedule_from_station_code_name"],
        scheduleToStationCodeName: json["schedule_to_station_code_name"],
        schedulePwt: json["schedule_pwt"],
        busClass: json["bus_class"],
        schedulePrice: json["schedule_price"],
        scheduleTimeStart: json["schedule_time_start"],
        scheduleTimeArrive: json["schedule_time_arrive"],
        licensePlateNumber: json["license_plate_number"],
        ticketsBooked: json["tickets_booked"],
        dateDeparture: json["date_departure"] == null
            ? null
            : DateTime.parse(json["date_departure"]),
        status: json["status"],
        statusBus: json["status_bus"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "user_name": userName,
        "schedule_from_station": scheduleFromStation,
        "schedule_to_station": scheduleToStation,
        "schedule_from_station_code_name": scheduleFromStationCodeName,
        "schedule_to_station_code_name": scheduleToStationCodeName,
        "schedule_pwt": schedulePwt,
        "bus_class": busClass,
        "schedule_price": schedulePrice,
        "schedule_time_start": scheduleTimeStart,
        "schedule_time_arrive": scheduleTimeArrive,
        "license_plate_number": licensePlateNumber,
        "tickets_booked": ticketsBooked,
        "date_departure":
            "${dateDeparture!.year.toString().padLeft(4, '0')}-${dateDeparture!.month.toString().padLeft(2, '0')}-${dateDeparture!.day.toString().padLeft(2, '0')}",
        "status": status,
        "status_bus": statusBus,
      };
}

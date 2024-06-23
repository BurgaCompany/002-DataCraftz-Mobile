import 'dart:convert';

class ReservationCheckModel {
  int? statusCode;
  String? message;
  DataReservationCheck? dataReservationCheck;

  ReservationCheckModel({
    this.statusCode,
    this.message,
    this.dataReservationCheck,
  });

  ReservationCheckModel copyWith({
    int? statusCode,
    String? message,
    DataReservationCheck? dataReservationCheck,
  }) =>
      ReservationCheckModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        dataReservationCheck: dataReservationCheck ?? this.dataReservationCheck,
      );

  factory ReservationCheckModel.fromRawJson(String str) =>
      ReservationCheckModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationCheckModel.fromJson(Map<String, dynamic> json) =>
      ReservationCheckModel(
        statusCode: json["statusCode"],
        message: json["message"],
        dataReservationCheck: json["data_reservation_check"] == null
            ? null
            : DataReservationCheck.fromJson(json["data_reservation_check"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data_reservation_check": dataReservationCheck?.toJson(),
      };
}

class DataReservationCheck {
  String? orderId;
  String? userName;
  int? driverId;
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

  DataReservationCheck({
    this.orderId,
    this.userName,
    this.driverId,
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

  DataReservationCheck copyWith({
    String? orderId,
    String? userName,
    int? driverId,
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
      DataReservationCheck(
        orderId: orderId ?? this.orderId,
        userName: userName ?? this.userName,
        driverId: driverId ?? this.driverId,
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

  factory DataReservationCheck.fromRawJson(String str) =>
      DataReservationCheck.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataReservationCheck.fromJson(Map<String, dynamic> json) =>
      DataReservationCheck(
        orderId: json["order_id"],
        userName: json["user_name"],
        driverId: json["driver_id"],
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
        "driver_id": driverId,
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

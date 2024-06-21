import 'dart:convert';

class ScheduleStationModel {
  int? statusCode;
  String? message;
  List<DataSchedule>? dataSchedule;

  ScheduleStationModel({
    this.statusCode,
    this.message,
    this.dataSchedule,
  });

  ScheduleStationModel copyWith({
    int? statusCode,
    String? message,
    List<DataSchedule>? dataSchedule,
  }) =>
      ScheduleStationModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        dataSchedule: dataSchedule ?? this.dataSchedule,
      );

  factory ScheduleStationModel.fromRawJson(String str) =>
      ScheduleStationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScheduleStationModel.fromJson(Map<String, dynamic> json) =>
      ScheduleStationModel(
        statusCode: json["statusCode"],
        message: json["message"],
        dataSchedule: json["data_schedule"] == null
            ? []
            : List<DataSchedule>.from(
                json["data_schedule"]!.map((x) => DataSchedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data_schedule": dataSchedule == null
            ? []
            : List<dynamic>.from(dataSchedule!.map((x) => x.toJson())),
      };
}

class DataSchedule {
  int? id;
  String? typeBus;
  int? busId;
  int? driverId;
  String? driverName;
  int? chair;
  String? platNumber;
  String? nameStation;
  String? toNameStation;
  String? fromStation;
  String? toStation;
  int? price;
  String? timeStart;
  String? timeArrive;
  String? pwt;
  DateTime? createAt;
  DateTime? updateAt;

  DataSchedule({
    this.id,
    this.typeBus,
    this.busId,
    this.driverId,
    this.driverName,
    this.chair,
    this.platNumber,
    this.nameStation,
    this.toNameStation,
    this.fromStation,
    this.toStation,
    this.price,
    this.timeStart,
    this.timeArrive,
    this.pwt,
    this.createAt,
    this.updateAt,
  });

  DataSchedule copyWith({
    int? id,
    String? typeBus,
    int? busId,
    int? driverId,
    String? driverName,
    int? chair,
    String? platNumber,
    String? nameStation,
    String? toNameStation,
    String? fromStation,
    String? toStation,
    int? price,
    String? timeStart,
    String? timeArrive,
    String? pwt,
    DateTime? createAt,
    DateTime? updateAt,
  }) =>
      DataSchedule(
        id: id ?? this.id,
        typeBus: typeBus ?? this.typeBus,
        busId: busId ?? this.busId,
        driverId: driverId ?? this.driverId,
        driverName: driverName ?? this.driverName,
        chair: chair ?? this.chair,
        platNumber: platNumber ?? this.platNumber,
        nameStation: nameStation ?? this.nameStation,
        toNameStation: toNameStation ?? this.toNameStation,
        fromStation: fromStation ?? this.fromStation,
        toStation: toStation ?? this.toStation,
        price: price ?? this.price,
        timeStart: timeStart ?? this.timeStart,
        timeArrive: timeArrive ?? this.timeArrive,
        pwt: pwt ?? this.pwt,
        createAt: createAt ?? this.createAt,
        updateAt: updateAt ?? this.updateAt,
      );

  factory DataSchedule.fromRawJson(String str) =>
      DataSchedule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataSchedule.fromJson(Map<String, dynamic> json) => DataSchedule(
        id: json["id"],
        typeBus: json["type_bus"],
        busId: json["bus_id"],
        driverId: json["driver_id"],
        driverName: json["driver_name"],
        chair: json["chair"],
        platNumber: json["plat_number"],
        nameStation: json["name_station"],
        toNameStation: json["to_name_station"],
        fromStation: json["from_station"],
        toStation: json["to_station"],
        price: json["price"],
        timeStart: json["time_start"],
        timeArrive: json["time_arrive"],
        pwt: json["pwt"],
        createAt: json["create_at"] == null
            ? null
            : DateTime.parse(json["create_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_bus": typeBus,
        "bus_id": busId,
        "driver_id": driverId,
        "driver_name": driverName,
        "chair": chair,
        "plat_number": platNumber,
        "name_station": nameStation,
        "to_name_station": toNameStation,
        "from_station": fromStation,
        "to_station": toStation,
        "price": price,
        "time_start": timeStart,
        "time_arrive": timeArrive,
        "pwt": pwt,
        "create_at": createAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
      };
}

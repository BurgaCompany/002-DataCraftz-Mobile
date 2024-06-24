import 'dart:convert';

class DriverScheduleModel {
    int? statusCode;
    String? message;
    List<DataScheduleDriver>? dataScheduleDriver;

    DriverScheduleModel({
        this.statusCode,
        this.message,
        this.dataScheduleDriver,
    });

    DriverScheduleModel copyWith({
        int? statusCode,
        String? message,
        List<DataScheduleDriver>? dataScheduleDriver,
    }) => 
        DriverScheduleModel(
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            dataScheduleDriver: dataScheduleDriver ?? this.dataScheduleDriver,
        );

    factory DriverScheduleModel.fromRawJson(String str) => DriverScheduleModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DriverScheduleModel.fromJson(Map<String, dynamic> json) => DriverScheduleModel(
        statusCode: json["statusCode"],
        message: json["message"],
        dataScheduleDriver: json["data_schedule_driver"] == null ? [] : List<DataScheduleDriver>.from(json["data_schedule_driver"]!.map((x) => DataScheduleDriver.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data_schedule_driver": dataScheduleDriver == null ? [] : List<dynamic>.from(dataScheduleDriver!.map((x) => x.toJson())),
    };
}

class DataScheduleDriver {
    int? id;
    String? typeBus;
    int? busId;
    int? driverId;
    String? driverName;
    int? chair;
    String? platNumber;
    String? nameStation;
    String? toNameStation;
    String? latitudeTo;
    String? longitudeTo;
    String? fromStation;
    String? toStation;
    int? price;
    String? timeStart;
    String? timeArrive;
    String? pwt;
    DateTime? createAt;
    DateTime? updateAt;

    DataScheduleDriver({
        this.id,
        this.typeBus,
        this.busId,
        this.driverId,
        this.driverName,
        this.chair,
        this.platNumber,
        this.nameStation,
        this.toNameStation,
        this.latitudeTo,
        this.longitudeTo,
        this.fromStation,
        this.toStation,
        this.price,
        this.timeStart,
        this.timeArrive,
        this.pwt,
        this.createAt,
        this.updateAt,
    });

    DataScheduleDriver copyWith({
        int? id,
        String? typeBus,
        int? busId,
        int? driverId,
        String? driverName,
        int? chair,
        String? platNumber,
        String? nameStation,
        String? toNameStation,
        String? latitudeTo,
        String? longitudeTo,
        String? fromStation,
        String? toStation,
        int? price,
        String? timeStart,
        String? timeArrive,
        String? pwt,
        DateTime? createAt,
        DateTime? updateAt,
    }) => 
        DataScheduleDriver(
            id: id ?? this.id,
            typeBus: typeBus ?? this.typeBus,
            busId: busId ?? this.busId,
            driverId: driverId ?? this.driverId,
            driverName: driverName ?? this.driverName,
            chair: chair ?? this.chair,
            platNumber: platNumber ?? this.platNumber,
            nameStation: nameStation ?? this.nameStation,
            toNameStation: toNameStation ?? this.toNameStation,
            latitudeTo: latitudeTo ?? this.latitudeTo,
            longitudeTo: longitudeTo ?? this.longitudeTo,
            fromStation: fromStation ?? this.fromStation,
            toStation: toStation ?? this.toStation,
            price: price ?? this.price,
            timeStart: timeStart ?? this.timeStart,
            timeArrive: timeArrive ?? this.timeArrive,
            pwt: pwt ?? this.pwt,
            createAt: createAt ?? this.createAt,
            updateAt: updateAt ?? this.updateAt,
        );

    factory DataScheduleDriver.fromRawJson(String str) => DataScheduleDriver.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataScheduleDriver.fromJson(Map<String, dynamic> json) => DataScheduleDriver(
        id: json["id"],
        typeBus: json["type_bus"],
        busId: json["bus_id"],
        driverId: json["driver_id"],
        driverName: json["driver_name"],
        chair: json["chair"],
        platNumber: json["plat_number"],
        nameStation: json["name_station"],
        toNameStation: json["to_name_station"],
        latitudeTo: json["latitude_to"],
        longitudeTo: json["longitude_to"],
        fromStation: json["from_station"],
        toStation: json["to_station"],
        price: json["price"],
        timeStart: json["time_start"],
        timeArrive: json["time_arrive"],
        pwt: json["pwt"],
        createAt: json["create_at"] == null ? null : DateTime.parse(json["create_at"]),
        updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
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
        "latitude_to": latitudeTo,
        "longitude_to": longitudeTo,
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

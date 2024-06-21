import 'dart:convert';

class StationModel {
    int? status;
    String? message;
    List<DataStation>? data;

    StationModel({
        this.status,
        this.message,
        this.data,
    });

    StationModel copyWith({
        int? status,
        String? message,
        List<DataStation>? data,
    }) => 
        StationModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory StationModel.fromRawJson(String str) => StationModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<DataStation>.from(json["data"]!.map((x) => DataStation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DataStation {
    int? id;
    String? name;
    String? codeName;
    String? address;

    DataStation({
        this.id,
        this.name,
        this.codeName,
        this.address,
    });

    DataStation copyWith({
        int? id,
        String? name,
        String? codeName,
        String? address,
    }) => 
        DataStation(
            id: id ?? this.id,
            name: name ?? this.name,
            codeName: codeName ?? this.codeName,
            address: address ?? this.address,
        );

    factory DataStation.fromRawJson(String str) => DataStation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataStation.fromJson(Map<String, dynamic> json) => DataStation(
        id: json["id"],
        name: json["name"],
        codeName: json["code_name"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code_name": codeName,
        "address": address,
    };
}

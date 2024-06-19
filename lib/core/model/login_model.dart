import 'dart:convert';

class UserModel {
    int? statusCode;
    String? message;
    String? token;
    String? role;
    Result? result;

    UserModel({
        this.statusCode,
        this.message,
        this.token,
        this.role,
        this.result,
    });

    UserModel copyWith({
        int? statusCode,
        String? message,
        String? token,
        String? role,
        Result? result,
    }) => 
        UserModel(
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            token: token ?? this.token,
            role: role ?? this.role,
            result: result ?? this.result,
        );

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        statusCode: json["statusCode"],
        message: json["message"],
        token: json["token"],
        role: json["role"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "token": token,
        "role": role,
        "result": result?.toJson(),
    };
}

class Result {
    int? id;
    String? name;
    String? email;
    String? address;
    String? gender;
    String? phoneNumber;
    dynamic images;
    dynamic rating;
    dynamic review;
    dynamic balance;
    dynamic idUpt;
    dynamic idPo;
    DateTime? createdAt;
    DateTime? updatedAt;

    Result({
        this.id,
        this.name,
        this.email,
        this.address,
        this.gender,
        this.phoneNumber,
        this.images,
        this.rating,
        this.review,
        this.balance,
        this.idUpt,
        this.idPo,
        this.createdAt,
        this.updatedAt,
    });

    Result copyWith({
        int? id,
        String? name,
        String? email,
        String? address,
        String? gender,
        String? phoneNumber,
        dynamic images,
        dynamic rating,
        dynamic review,
        dynamic balance,
        dynamic idUpt,
        dynamic idPo,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Result(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            address: address ?? this.address,
            gender: gender ?? this.gender,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            images: images ?? this.images,
            rating: rating ?? this.rating,
            review: review ?? this.review,
            balance: balance ?? this.balance,
            idUpt: idUpt ?? this.idUpt,
            idPo: idPo ?? this.idPo,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        images: json["images"],
        rating: json["rating"],
        review: json["review"],
        balance: json["balance"],
        idUpt: json["id_upt"],
        idPo: json["id_po"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "gender": gender,
        "phone_number": phoneNumber,
        "images": images,
        "rating": rating,
        "review": review,
        "balance": balance,
        "id_upt": idUpt,
        "id_po": idPo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

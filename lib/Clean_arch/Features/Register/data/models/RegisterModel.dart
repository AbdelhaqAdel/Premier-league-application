// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  bool? status;
  String? message;
  Data? data;

  UserRegisterModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;

  Data({
    this.name,
    this.email,
    this.phone,
    this.id,
    this.image,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "id": id,
    "image": image,
    "token": token,
  };
}

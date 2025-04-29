// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  List<Login>? login;

  LoginModel({
    this.login,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    login: json["login"] == null ? [] : List<Login>.from(json["login"]!.map((x) => Login.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "login": login == null ? [] : List<dynamic>.from(login!.map((x) => x.toJson())),
  };
}

class Login {
  String? id;
  String? email;
  String? password;

  Login({
    this.id,
    this.email,
    this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    id: json["id"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
  };
}

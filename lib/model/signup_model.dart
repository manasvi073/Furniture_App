// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  List<Signup>? signup;

  SignupModel({
    this.signup,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    signup: json["signup"] == null ? [] : List<Signup>.from(json["signup"]!.map((x) => Signup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "signup": signup == null ? [] : List<dynamic>.from(signup!.map((x) => x.toJson())),
  };
}

class Signup {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  Signup({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };
}

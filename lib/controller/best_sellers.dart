// To parse this JSON data, do
//
//     final bestSellersModel = bestSellersModelFromJson(jsonString);

import 'dart:convert';

List<BestSellersModel> bestSellersModelFromJson(String str) => List<BestSellersModel>.from(json.decode(str).map((x) => BestSellersModel.fromJson(x)));

String bestSellersModelToJson(List<BestSellersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BestSellersModel {
  String? id;
  String? name;
  String? categoryType;
  String? price;
  String? image;
  String? rating;

  BestSellersModel({
    this.id,
    this.name,
    this.categoryType,
    this.price,
    this.image,
    this.rating,
  });

  factory BestSellersModel.fromJson(Map<String, dynamic> json) => BestSellersModel(
    id: json["id"],
    name: json["name"],
    categoryType: json["categoryType"],
    price: json["price"],
    image: json["Image"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryType": categoryType,
    "price": price,
    "Image": image,
    "rating": rating,
  };
}

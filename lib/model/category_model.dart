// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String? id;
  String? name;
  String? categoryType;
  String? description;
  String? price;
  String? image;
  String? rating;

  CategoryModel({
    this.id,
    this.name,
    this.categoryType,
    this.description,
    this.price,
    this.image,
    this.rating,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    categoryType: json["categoryType"],
    description: json["description"],
    price: json["price"],
    image: json["Image"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryType": categoryType,
    "description": description,
    "price": price,
    "Image": image,
    "rating": rating,
  };
}

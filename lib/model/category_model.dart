// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  List<Category>? categories;

  CategoryModel({
    this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  String? id;
  String? name;
  String? categoryType;
  String? description;
  String? price;
  String? image;
  String? rant;

  Category({
    this.id,
    this.name,
    this.categoryType,
    this.description,
    this.price,
    this.image,
    this.rant,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    categoryType: json["categoryType"],
    description: json["description"],
    price: json["price"],
    image: json["Image"],
    rant: json["rant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryType": categoryType,
    "description": description,
    "price": price,
    "Image": image,
    "rant": rant,
  };
}

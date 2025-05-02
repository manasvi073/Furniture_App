class CategoryModel {
  String? id;
  String? name;
  String? categoryType;
  String? description;
  String? price;
  String? image;
  String? rating;
  List<String>? subImages;

  CategoryModel({
    this.id,
    this.name,
    this.categoryType,
    this.description,
    this.price,
    this.image,
    this.rating,
    this.subImages,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        categoryType: json["categoryType"],
        description: json["description"],
        price: json["price"],
        image: json["Image"],
        rating: json["rating"],
        subImages: json["subImages"] == null
            ? []
            : List<String>.from(json["subImages"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryType": categoryType,
        "description": description,
        "price": price,
        "Image": image,
        "rating": rating,
        "subImages": subImages ?? [],
      };
}

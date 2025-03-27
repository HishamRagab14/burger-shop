// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) {
  final jsonData = json.decode(str);

  final categoriesList =
      jsonData is List ? jsonData : jsonData['categories'] as List<dynamic>;

  return categoriesList.map((x) => CategoriesModel.fromJson(x)).toList();

  // return List<CategoriesModel>.from(
  //   json.decode(str).map((x) => CategoriesModel.fromJson(x)),
  // );
}

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CategoriesModel {
//     final List<Category> categories;
//     CategoriesModel({
//         required this.categories,
//     });
//     factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
//         categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//     );
//     Map<String, dynamic> toJson() => {
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//     };
// }

class CategoriesModel {
  final String id;
  final String title;
  final String value;
  final String imageUrl;
  // final String description;
  // final bool isAvailable;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        // id: json["_id"],
        // title: json["title"],
        // value: json["value"],
        // imageUrl: json["imageUrl"],
        id: json["_id"]?.toString() ?? "", // Handle null/Non-String
        title:
            json["title"]?.toString() ??
            json["value"]?.toString() ??
            "No Title", // Fallback chain
        value:
            json["value"]?.toString() ??
            json["title"]?.toString() ??
            "", // Fallback chain
        imageUrl: json["imageUrl"],
        // description: json["description"],
        // isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "value": value,
    "imageUrl": imageUrl,
    // "description": description,
    // "isAvailable": isAvailable,
  };
}

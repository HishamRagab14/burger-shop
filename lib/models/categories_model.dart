// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    final List<Category> categories;

    CategoriesModel({
        required this.categories,
    });

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    final String id;
    final String title;
    final String value;
    final String imageUrl;
    final String description;
    final bool isAvailable;

    Category({
        required this.id,
        required this.title,
        required this.value,
        required this.imageUrl,
        required this.description,
        required this.isAvailable,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        value: json["value"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "value": value,
        "imageUrl": imageUrl,
        "description": description,
        "isAvailable": isAvailable,
    };
}

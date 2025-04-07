import 'dart:convert';
import 'dart:developer';

// List<FoodsModel> foodsModelFromJson(String str) {
//   try {
//     final decoded = json.decode(str);

//     if (decoded is List) {
//       return List<FoodsModel>.from(decoded.map((x) => FoodsModel.fromJson(x)));
//     }

//     // Case 2: Response has a 'foodsList' key (your current expectation)
//     if (decoded is Map<String, dynamic> && decoded.containsKey("foodsList")) {
//       return List<FoodsModel>.from(
//         decoded["foodsList"].map((x) => FoodsModel.fromJson(x)),
//       );
//     }

//     throw Exception(
//       "Invalid API response format: Expected List or 'foodsList' key",
//     );
//   } catch (e, stackTrace) {
//     log('Error parsing foods: $e', stackTrace: stackTrace);
//     return []; // Return empty list on error (or throw if you prefer)
//   }
// }

// List<FoodsModel> foodsModelFromJson(String str) {
//   final decoded = json.decode(str);

//   // If API returns direct array
//   if (decoded is List) {
//     return decoded.map((x) => FoodsModel.fromJson(x)).toList();
//   }

//   // If API returns wrapped object
//   if (decoded is Map) {
//     if (decoded['results'] != null) {
//       return (decoded['results'] as List)
//           .map((x) => FoodsModel.fromJson(x))
//           .toList();
//     }
//     if (decoded['data'] != null) {
//       return (decoded['data'] as List)
//           .map((x) => FoodsModel.fromJson(x))
//           .toList();
//     }
//   }

//   throw Exception('Unsupported API response format');
// }

List<FoodsModel> foodsModelFromJson(String str) {
  final decoded = json.decode(str);

  if (decoded is List) {
    return decoded.map((x) => FoodsModel.fromJson(x)).toList();
  }

  if (decoded is Map) {
    if (decoded['results'] != null) {
      return (decoded['results'] as List)
          .map((x) => FoodsModel.fromJson(x))
          .toList();
    }
    if (decoded['data'] != null) {
      return (decoded['data'] as List)
          .map((x) => FoodsModel.fromJson(x))
          .toList();
    }
    if (decoded['foods'] != null) {
      return (decoded['foods'] as List)
          .map((x) => FoodsModel.fromJson(x))
          .toList();
    }
    if (decoded['foodsList'] != null) {
      return (decoded['foodsList'] as List)
          .map((x) => FoodsModel.fromJson(x))
          .toList();
    }
  }

  throw Exception('Unsupported API response format');
}

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  final String id;
  final String title;
  final String time;
  final List<String> foodTags;
  final String category;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Map<String, dynamic>> additive;
  final String imageUrl;

  FoodsModel({
    required this.id,
    required this.title,
    required this.time,
    required this.foodTags,
    required this.category,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additive,
    required this.imageUrl,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    try {
      // Helper to parse lists safely
      List<String> parseStringList(dynamic list) {
        if (list is List) return list.map((e) => e?.toString() ?? '').toList();
        return [];
      }

      // Helper to parse additive safely
      List<Map<String, dynamic>> parseAdditive(dynamic additive) {
        if (additive is List) {
          return additive.whereType<Map>().map((e) {
            try {
              return Map<String, dynamic>.from(e);
            } catch (_) {
              return <String, dynamic>{};
            }
          }).toList();
        }
        return [];
      }

      return FoodsModel(
        id: json["_id"]?.toString() ?? '',
        title: json["title"]?.toString() ?? '',
        time: json["time"]?.toString() ?? '',
        foodTags: parseStringList(json["foodTags"]),
        category: json["category"]?.toString() ?? '',
        foodType: parseStringList(json["foodType"]),
        code: json["code"]?.toString() ?? '',
        isAvailable: json["isAvailable"] ?? false,
        restaurant: json["restaurant"]?.toString() ?? '',
        rating:
            (json["rating"] is int
                ? json["rating"].toDouble()
                : json["rating"] as double?) ??
            0.0,
        ratingCount: json["ratingCount"]?.toString() ?? '0',
        description: json["description"]?.toString() ?? '',
        price:
            (json["price"] is int
                ? json["price"].toDouble()
                : json["price"] as double?) ??
            0.0,
        additive: parseAdditive(json["additive"]),
        imageUrl: json["imageUrl"]?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      log('Error parsing food item: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "time": time,
    "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
    "category": category,
    "foodType": List<dynamic>.from(foodType.map((x) => x)),
    "code": code,
    "isAvailable": isAvailable,
    "restaurant": restaurant,
    "rating": rating,
    "ratingCount": ratingCount,
    "description": description,
    "price": price,
    "additive": List<dynamic>.from(additive.map((x) => x)),
    "imageUrl": imageUrl,
  };
}

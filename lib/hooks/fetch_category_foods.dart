import 'dart:async';
import 'dart:convert';
// import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/category_controller.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/models/hook_models/foods_hook.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchFoodsByCategory() {
  final controller = Get.find<CategoryController>();
  final foods = useState<List<FoodsModel>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);

  Future<void> actualFetchDataLogic() async {

    if (controller.categoryValue.isEmpty) {
      foods.value = [];
      return;
    }
    error.value = null;
    try {
      final url = Uri.parse(
        '$appBaseUrl/api/foods/byCategory/${controller.categoryValue}',
      );
      debugPrint('🌐 Calling FoodsByCategory: $url');

      final response = await http
          .get(url)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Request timed out"),
          );
      debugPrint('🔵 FoodsByCategory Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['foods'] != null && jsonData['foods'] is List) {
          foods.value =
              (jsonData['foods'] as List)
                  .map((item) => FoodsModel.fromJson(item))
                  .toList();
        } else {
          foods.value = [];
        }
      } else {
        error.value = Exception(
          'API Error ${response.statusCode}: ${response.body}',
        );
        foods.value = [];
      }
    } on TimeoutException catch (e) {
      debugPrint('🔴 Timeout Error FoodsByCategory: $e');
      error.value = Exception("Request timed out: ${e.message}");
      foods.value = [];
    } catch (e) {
      debugPrint('🔴 Error FoodsByCategory: $e');
      error.value = e is Exception ? e : Exception(e.toString());
      foods.value = [];
    } finally {
      // isLoading.value = false; // REMOVED
      debugPrint(
        '🏁 FetchFoodsByCategory completed for Category: ${controller.categoryValue}',
      );
    }
  }

  final fetchDataCallback = useCallback(actualFetchDataLogic, [
    controller.categoryValue,
  ]);

  useEffect(() {
    bool isMounted = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isMounted && !isLoading.value) {
        isLoading.value = true;
        fetchDataCallback().whenComplete(() {
          if (isMounted) {
            isLoading.value = false;
          }
        });
      }
    });
    return () {
      isMounted = false;
    };
  }, [fetchDataCallback]);

  void handleRefetch() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isLoading.value) {
        isLoading.value = true;
        fetchDataCallback().whenComplete(() {
          isLoading.value = false;
        });
      }
    });
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: handleRefetch,
  );
}

// FetchFoods useFetchFoodsByCategory() {
//   final controller = Get.find<CategoryController>();
//   final foods = useState<List<FoodsModel>?>(null);
//   final isLoading = useState<bool>(false);
//   final error = useState<Exception?>(null);

//   final fetchDataCallback = useCallback(() async {
//     if (controller.categoryValue.isEmpty) {
//       foods.value = [];
//       isLoading.value = false;
//       return;
//     }

//     isLoading.value = true;
//     error.value = null;

//     try {
//       final url = Uri.parse(
//         '$appBaseUrl/api/foods/byCategory/${controller.categoryValue}',
//       );
//       debugPrint('🌐 Calling: $url');

//       final response = await http.get(url);
//       debugPrint('🔵 Status: ${response.statusCode}');
//       debugPrint('📦 Response: ${response.body}');

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData['foods'] != null) {
//           foods.value =
//               (jsonData['foods'] as List)
//                   .map((item) => FoodsModel.fromJson(item))
//                   .toList();
//         } else {
//           foods.value = [];
//         }
//       } else {
//         throw Exception('API Error ${response.statusCode}: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('🔴 Error: $e');
//       error.value = e is Exception ? e : Exception(e.toString());
//       foods.value = [];
//     } finally {
//       isLoading.value = false;
//     }
//   }, [controller.categoryValue]);

//   useEffect(() {
//     fetchDataCallback();
//     return null;
//   }, [fetchDataCallback]);

//   return FetchFoods(
//     data: foods.value,
//     isLoading: isLoading.value,
//     error: error.value,
//     refetch: fetchDataCallback,
//   );
// }

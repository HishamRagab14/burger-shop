import 'dart:async';
import 'dart:convert';
// import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/models/hook_models/foods_hook.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchFoodsByRestaurant(String id) {
  // final controller = Get.find<CategoryController>();
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  // final apiError = useState<ApiError?>(null);

  Future<void> actualFetchDataLogic() async {
    error.value = null;

    if (id.isEmpty || id == "null" || id == "undefined") {
      debugPrint("Restaurant ID for foods is invalid: '$id'. Skipping fetch.");
      error.value = Exception("Invalid restaurant ID for foods provided.");

      foods.value = [];
      return;
    }

    try {
      final url = Uri.parse('$appBaseUrl/api/foods/restaurant-foods/$id');
      debugPrint('🌐 Calling: $url');

      final response = await http
          .get(url)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Request timed out"),
          );
      debugPrint('🔵 Status: ${response.statusCode}');
      debugPrint('📦 Response: ${response.body}');

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded is Map &&
            decoded.containsKey('foods') &&
            decoded['foods'] is List) {
          final List<dynamic> rawFoods = decoded['foods'];
          foods.value =
              rawFoods.map((json) => FoodsModel.fromJson(json)).toList();
        } else if (decoded is List) {
          foods.value =
              decoded.map((json) => FoodsModel.fromJson(json)).toList();
        } else {
          foods.value = [];
          debugPrint(
            "Unexpected JSON structure for foods by restaurant: $decoded",
          );
        }
      } else {
        error.value = Exception(
          'API Error ${response.statusCode}: ${response.body}',
        );
        foods.value = [];
      }
    } on TimeoutException catch (e) {
      debugPrint('🔴 Timeout Error FoodsByRestaurant: $e');
      error.value = Exception("Request timed out: ${e.message}");
      foods.value = [];
    } catch (e) {
      debugPrint('🔴 Error FoodsByRestaurant: $e');
      error.value = e is Exception ? e : Exception(e.toString());
      foods.value = [];
    } finally {
      debugPrint('🏁 FetchFoodsByRestaurant completed for ID: $id');
    }
  }

  final fetchDataCallback = useCallback(actualFetchDataLogic, [id]);

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



//   useEffect(() {
  //   final timer = Timer(const Duration(milliseconds: 500), () {
  //     fetchData(categoryCode, foodCode); // استدعاء fetchData بعد تأخير 500 مللي ثانية
  //   });
  //   return () => timer.cancel(); // إلغاء الـ Timer إذا تغيرت القيم
  // }, [categoryCode, foodCode]);
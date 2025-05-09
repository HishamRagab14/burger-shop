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
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);

  Future<void> fetchData() async {
    if (controller.categoryValue.isEmpty) {
      foods.value = [];
      return;
    }

    isLoading.value = true;
    try {
      final url = Uri.parse(
        '$appBaseUrl/api/foods/byCategory/${controller.categoryValue}',
      );
      debugPrint('🌐 Calling: $url');

      final response = await http.get(url);
      debugPrint('🔵 Status: ${response.statusCode}');
      debugPrint('📦 Response: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['foods'] != null) {
          foods.value =
              (jsonData['foods'] as List)
                  .map((item) => FoodsModel.fromJson(item))
                  .toList();
        } else {
          foods.value = [];
        }
      } else {
        throw Exception('API Error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      debugPrint('🔴 Error: $e');
      error.value = e is Exception ? e : Exception(e.toString());
      foods.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, [controller.categoryValue]);

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}



//   useEffect(() {
  //   final timer = Timer(const Duration(milliseconds: 500), () {
  //     fetchData(categoryCode, foodCode); // استدعاء fetchData بعد تأخير 500 مللي ثانية
  //   });
  //   return () => timer.cancel(); // إلغاء الـ Timer إذا تغيرت القيم
  // }, [categoryCode, foodCode]);
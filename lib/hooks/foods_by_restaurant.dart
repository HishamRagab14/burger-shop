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
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  // final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse('$appBaseUrl/api/foods/restaurant-foods/$id');
      debugPrint('🌐 Calling: $url');

      final response = await http.get(url);
      debugPrint('🔵 Status: ${response.statusCode}');
      debugPrint('📦 Response: ${response.body}');

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> rawFoods = decoded['foods'];
        foods.value =
            rawFoods.map((json) => FoodsModel.fromJson(json)).toList();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), fetchData);
    });

    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}



//   useEffect(() {
  //   final timer = Timer(const Duration(milliseconds: 500), () {
  //     fetchData(categoryCode, foodCode); // استدعاء fetchData بعد تأخير 500 مللي ثانية
  //   });
  //   return () => timer.cancel(); // إلغاء الـ Timer إذا تغيرت القيم
  // }, [categoryCode, foodCode]);
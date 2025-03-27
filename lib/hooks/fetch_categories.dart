

// import 'package:burger_shop_app/constants/constants.dart';
// import 'package:burger_shop_app/models/api_error.dart';
// import 'package:burger_shop_app/models/categories_model.dart';
// import 'package:burger_shop_app/models/hook_models/hook_results.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:http/http.dart' as http;

// FetchHook useFetchCategories() {
//   final categoriesItems = useState<List<CategoriesModel>?>(null);
//   final isLoading = useState<bool>(false);
//   final error = useState<Exception?>(null);
//   final apiError = useState<ApiError?>(null);

//   Future<void> fetchData() async {
//     isLoading.value = true;

//     try {
//       Uri url = Uri.parse('$appBaseUrl/api/category/random');
//        print("Before request");
//       final response = await http.get(url);
//       print("after request");
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         categoriesItems.value = categoriesModelFromJson(response.body);
//       } else {
//         apiError.value = apiErrorFromJson(response.body);
//       }
//     } catch (e) {
//       error.value = e as Exception;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   useEffect(() {
//     fetchData();
//     return null;
//   }, []);

//   void refetch() {
//     isLoading.value = true;
//     fetchData();
//   }

//   return FetchHook(
//     data: categoriesItems.value,
//     isLoading: isLoading.value,
//     error: error.value,
//     refetch: refetch,
//   );
// }
import 'dart:async';
import 'dart:developer';

import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/categories_model.dart';
import 'package:burger_shop_app/models/hook_models/hook_results.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchCategories() {
  final categoriesItems = useState<List<CategoriesModel>>([]); // Initialize as empty list
  final isLoading = useState<bool>(true); // Start in loading state
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    try {
      
      final url = Uri.parse('$appBaseUrl/api/category/random');
      log("🔗 Full URL: $url");
      
      final response = await http.get(url)
        .timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException("Request timed out after 10 seconds");
        });

      log("✅ Status: ${response.statusCode}");
      log("📦 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        try {
          final data = categoriesModelFromJson(response.body);
          log("🔄 Parsed ${data.length} categories");
          categoriesItems.value = data;
        } catch (e) {
          throw Exception("Failed to parse categories: $e");
        }
      } else {
        throw Exception("API Error ${response.statusCode}: ${response.body}");
      }
    } on TimeoutException catch (e) {
      error.value = Exception("Request timed out");
      log("⏰ Timeout: $e");
    } catch (e) {
      error.value = e as Exception;
      log("🔥 Critical Error: $e");
    } finally {
      isLoading.value = false;
      log("🏁 Fetch completed");
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  return FetchHook(
    data: categoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}
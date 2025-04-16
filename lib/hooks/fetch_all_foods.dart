import 'dart:async';
import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/models/hook_models/hook_results.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllFoods(String code) {
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    error.value = null;
    apiError.value = null;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/byCode/$code');
      // log("🔗 Full URL: $url");

      final response = await http
          .get(url)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Request timed out"),
          );
          log("Response Body: ${response.body}");


      if (response.statusCode == 200) {
        final data = foodsModelFromJson(response.body);
        foods.value = data;
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } on TimeoutException catch (e) {
      error.value = Exception("Request timed out");
      log("⏰ Timeout: $e");
    } catch (e, stackTrace) {
      error.value = Exception(e.toString());
      log("🔥 Unexpected Error: $e", stackTrace: stackTrace);
    } finally {
      isLoading.value = false;
      log("🏁 Fetch completed");
    }
  }

  useEffect(() {
    // Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  return FetchHook(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}

import 'dart:async';
import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/models/hook_models/foods_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchAllFoods(String code) {
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  // final apiError = useState<ApiError?>(null);

  Future<void> actualFetchDataLogic() async {
    error.value = null;
    foods.value = [];
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
        try {
          final parsedApiError = apiErrorFromJson(response.body);
          error.value = Exception(
            "API Error ${response.statusCode}: ${parsedApiError.message}",
          );
        } catch (_) {
          error.value = Exception(
            'API Error ${response.statusCode}: ${response.body}',
          ); // Fallback
        }
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

  final fetchDataCallback = useCallback(actualFetchDataLogic, [code]);

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

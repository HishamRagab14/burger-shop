import 'dart:async';
import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/hook_models/hook_results.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllRestaurants() {
  final restaurants = useState<List<RestaurantsModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    error.value = null;
    restaurants.value = [];

    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/all');
      log("🔗 Full URL: $url");

      final response = await http
          .get(
            url,
            headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MTEwYzM1NmJhMDU3OTE2YjQ3NTRmZiIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZW1haWwiOiJoaXNoYW1yYWdhYjc0QHlhaG9vLmNvbSIsImlhdCI6MTc0Njk2NjgwMSwiZXhwIjoxNzQ4NzgxMjAxfQ.NUF1Bmo8O24f8qepYREdkUVU9MQNGS4xh0uDH9XmRVc',
              'Content-Type': 'application/json',
            },
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Request timed out"),
          );

      // log("✅ Status: ${response.statusCode}");
      // log("📦 Response Body: ${response.body}");
      if (response.statusCode == 200) {
        final data = restaurantsModelFromJson(response.body);
        // log("🔄 Parsed ${data.length} foods");
        restaurants.value = data;
      } else {
        try {
          final parsedApiError = apiErrorFromJson(response.body);
          error.value = Exception(
            "API Error ${response.statusCode}: ${parsedApiError.message}",
          );
        } catch (_) {
          error.value = Exception(
            'API Error ${response.statusCode}: ${response.body}',
          );
        }
      }
    } on TimeoutException {
      error.value = Exception("Request timed out");
      // log("⏰ Timeout: $e");
    } catch (e) {
      error.value = e as Exception;
      // log("🔥 Critical Error: $e");
    } finally {
      isLoading.value = false;
      // log("🏁 Fetch completed");
    }
  }

  final fetchDataCallback = useCallback(fetchData, const []);

  useEffect(() {
    fetchDataCallback();
    return null;
  }, [fetchDataCallback]);

  return FetchHook(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchDataCallback,
  );
}

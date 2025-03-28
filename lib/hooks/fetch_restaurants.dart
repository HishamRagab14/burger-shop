import 'dart:async';
import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/hook_models/hook_results.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchRestaurants(String code) {
  final restaurants = useState<List<RestaurantsModel>>([]);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/$code');
      log("🔗 Full URL: $url");

      final response = await http
          .get(
            url,
            headers: {
              'Authorization': 
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTJkZjllMmU1YzM3MjVkZTRhZjU1ZiIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZW1haWwiOiJoaXNoYW1yYWdhYjE0QHlhaG9vLmNvbSIsImlhdCI6MTc0MjkyNjk4MSwiZXhwIjoxNzQ0NzQxMzgxfQ.oe1hdvU-YPI9BzIg2IcHznfq6cUoS4gCqFHUa-wCXXI', // Add your actual token here
              'Content-Type': 'application/json',
            },
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Request timed out"),
          );

      log("✅ Status: ${response.statusCode}");
      log("📦 Response Body: ${response.body}");
      if (response.statusCode == 200) {
        final data = restaurantsModelFromJson(response.body);
        log("🔄 Parsed ${data.length} foods");
        restaurants.value = data;
      } else {
        apiError.value = apiError.value;
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
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}

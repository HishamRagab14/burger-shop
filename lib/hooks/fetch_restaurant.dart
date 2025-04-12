import 'dart:async';
import 'dart:developer';

import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/hook_models/restaurant_hook.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchRestaurant useFetchRestaurant(String id) {
  final restaurant = useState<RestaurantsModel?>(null);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/byId/$id');

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
      log("Response Body: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = singleRestaurantModelFromJson(response.body);
        restaurant.value = data;
      } else {
        apiError.value = apiError.value;
      }
    } on TimeoutException catch (e) {
      error.value = Exception("Request timed out");
      log("⏰ Timeout: $e");
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchRestaurant(
    data: restaurant.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

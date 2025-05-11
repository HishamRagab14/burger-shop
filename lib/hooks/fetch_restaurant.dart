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
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  // final apiError = useState<ApiError?>(null);

  final fetchDataCallback = useCallback(() async {
    if (id.isEmpty || id == "null" || id == "undefined") {
      log("Restaurant ID is invalid: '$id'. Skipping fetch.");
      error.value = Exception("Invalid restaurant ID provided.");
      isLoading.value = false;
      restaurant.value = null;
      return;
    }

    isLoading.value = true; // MODIFICATION 2
    error.value = null;
    restaurant.value = null; // Reset

    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/byId/$id');
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
      log("Response Status for restaurant byId/$id: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = singleRestaurantModelFromJson(response.body);
        restaurant.value = data;
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
    } catch (e) {
      error.value = e is Exception ? e : Exception(e.toString());
      log("🔥 Critical Error useFetchRestaurant: $e");
    } finally {
      isLoading.value = false;
    }
    // MODIFICATION 4: useCallback dependency
  }, [id]);

  useEffect(() {
    fetchDataCallback();
    return null;
  }, [fetchDataCallback]);

  return FetchRestaurant(
    data: restaurant.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchDataCallback,
  );
}

  // Future<void> fetchData() async {
  //   isLoading.value = true;
  //   try {
  //     Uri url = Uri.parse('$appBaseUrl/api/restaurant/byId/$id');

  //     final response = await http
  //         .get(
  //           url,
  //           headers: {
  //             'Authorization':
  //                 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MDliZTJiM2I2NTBkNWY0YTU5MjBlYiIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZW1haWwiOiJoaXNoYW1yYWdhYjE0QHlhaG9vLmNvbSIsImlhdCI6MTc0NTkyNjg3NiwiZXhwIjoxNzQ3NzQxMjc2fQ.gSNMs-ZhK_CnuiTeOKq3jZOzFq1NEX2AEwrBf4W9WNY',
  //             'Content-Type': 'application/json',
  //           },
  //         )
  //         .timeout(
  //           const Duration(seconds: 10),
  //           onTimeout: () => throw TimeoutException("Request timed out"),
  //         );
  //     log("Response Body: ${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       final data = singleRestaurantModelFromJson(response.body);
  //       restaurant.value = data;
  //     } else {
  //       apiError.value = apiError.value;
  //     }
  //   } on TimeoutException catch (e) {
  //     error.value = Exception("Request timed out");
  //     log("⏰ Timeout: $e");
  //   } catch (e) {
  //     error.value = e as Exception;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  

  // void refetch() {
  //   isLoading.value = true;
  //   fetchData();
  // }

  // return FetchRestaurant(
  //   data: restaurant.value,
  //   isLoading: isLoading.value,
  //   error: error.value,
  //   refetch: refetch,
  // );


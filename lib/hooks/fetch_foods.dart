// import 'dart:async';
// import 'dart:developer';
// import 'package:burger_shop_app/constants/constants.dart';
// import 'package:burger_shop_app/models/api_error.dart';
// import 'package:burger_shop_app/models/foods_model.dart';
// import 'package:burger_shop_app/models/hook_models/foods_hook.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:http/http.dart' as http;

// FetchFoods useFetchFoods(String code) {
//   final foods = useState<List<FoodsModel>>([]);
//   final isLoading = useState<bool>(false);
//   final error = useState<Exception?>(null);
//   // final apiError = useState<ApiError?>(null);

//   Future<void> actualFetchData() async {
//     isLoading.value = true;
//     error.value = null;
//     foods.value = [];

//     try {
//       Uri url = Uri.parse('$appBaseUrl/api/foods/recommendation/$code');
//       log("🔗 Requesting Recommendation Foods URL: ${url.toString()} for code: $code");

//       final response = await http
//           .get(
//             url,
//             headers: {
//               'Authorization':
//                   'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MTEwYzM1NmJhMDU3OTE2YjQ3NTRmZiIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZW1haWwiOiJoaXNoYW1yYWdhYjc0QHlhaG9vLmNvbSIsImlhdCI6MTc0Njk2NjgwMSwiZXhwIjoxNzQ4NzgxMjAxfQ.NUF1Bmo8O24f8qepYREdkUVU9MQNGS4xh0uDH9XmRVc', // Add your actual token here
//               'Content-Type': 'application/json',
//             },
//           )
//           .timeout(
//             const Duration(seconds: 10),
//             onTimeout: () => throw TimeoutException("Request timed out"),
//           );
//           log("✅ Recommendation Foods Status: ${response.statusCode}");

//       // log("📦 Response Body: ${response.body}");
//       if (response.statusCode == 200) {
//         final data = foodsModelFromJson(response.body);
//         foods.value = data;
//       } else {
//         String errorMessage = 'API Error ${response.statusCode}';
//         try {
//           final parsedApiError = apiErrorFromJson(response.body);
//           errorMessage += ": ${parsedApiError.message}";
//         } catch (_) {
//           errorMessage += ": ${response.body}";
//         }
//         error.value = Exception(errorMessage);
//       }
//     } on TimeoutException catch (e) {
//       error.value = Exception("Request timed out: ${e.message}"); // Include original message
//       log("⏰ Timeout fetching recommendations: $e");
//     } catch (e) {
//       error.value = Exception("Failed to fetch recommendations: ${e.toString()}");
//       log("🔥 Critical Error fetching recommendations: $e");
//     } finally {
//       isLoading.value = false;
//       log("🏁 Fetch recommendations completed for code: $code");
//     }
//   }

//   final fetchDataCallback = useCallback(actualFetchData, [code]);

//   useEffect(() {
//     fetchDataCallback();
//     return null;
//   }, [fetchDataCallback]);

//   return FetchFoods(
//     data: foods.value,
//     isLoading: isLoading.value,
//     error: error.value,
//     refetch: fetchDataCallback,
//   );
// }


import 'dart:async';
import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/models/hook_models/foods_hook.dart';
import 'package:flutter/widgets.dart'; //  <-- (إضافة) مهم لـ WidgetsBinding
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchFoods(String code) {
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(false); 
  final error = useState<Exception?>(null);
  
  Future<void> actualFetchDataLogic() async { // تم تغيير الاسم قليلاً للوضوح
    error.value = null;
    foods.value = [];

    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/recommendation/$code');
      log("🔗 Requesting Recommendation Foods URL: ${url.toString()} for code: $code");

      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MTEwYzM1NmJhMDU3OTE2YjQ3NTRmZiIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZW1haWwiOiJoaXNoYW1yYWdhYjc0QHlhaG9vLmNvbSIsImlhdCI6MTc0Njk2NjgwMSwiZXhwIjoxNzQ4NzgxMjAxfQ.NUF1Bmo8O24f8qepYREdkUVU9MQNGS4xh0uDH9XmRVc',
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException("Request timed out"),
      );
      log("✅ Recommendation Foods Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = foodsModelFromJson(response.body);
        foods.value = data;
      } else {
        String errorMessage = 'API Error ${response.statusCode}';
        try {
          final parsedApiError = apiErrorFromJson(response.body);
          errorMessage += ": ${parsedApiError.message}";
        } catch (_) {
          errorMessage += ": ${response.body}";
        }
        error.value = Exception(errorMessage);
      }
    } on TimeoutException catch (e) {
      error.value = Exception("Request timed out: ${e.message}");
      log("⏰ Timeout fetching recommendations: $e");
    } catch (e) {
      error.value = Exception("Failed to fetch recommendations: ${e.toString()}");
      log("🔥 Critical Error fetching recommendations: $e");
    } finally {
      // isLoading.value = false; // <-- (إزالة) لن نضعها هنا أيضًا
      log("🏁 Fetch recommendations logic completed for code: $code");
    }
  }

  // useCallback يبقى كما هو تقريبًا، ولكنه الآن يلف actualFetchDataLogic
  final fetchDataCallback = useCallback(actualFetchDataLogic, [code]);

  useEffect(() {
    // متغير محلي لتتبع حالة الـ mount (اختياري لكن جيد)
    bool isMounted = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isMounted && !isLoading.value) { // فقط إذا لم نكن نحمل بالفعل
        isLoading.value = true; // الآن نبدأ التحميل (بعد الإطار)
        fetchDataCallback().whenComplete(() { // نستدعي الدالة التي تقوم بالـ HTTP
          if (isMounted) { // نتأكد مرة أخرى قبل تحديث الحالة
            isLoading.value = false; // ننهي التحميل بعد اكتمال الجلب
          }
        });
      }
    });

    return () {
      isMounted = false; // دالة التنظيف عند عمل unmount للـ Hook
    };
  }, [fetchDataCallback]); // الاعتماد على نسخة fetchDataCallback

  // دالة الـ refetch تحتاج أيضًا لاستخدام نفس المنطق
  void handleRefetch() {
    // يمكن استخدام متغير لتتبع حالة الـ mount هنا أيضًا إذا أردت
    // ولكن addPostFrameCallback يوفر بعض الأمان
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isLoading.value) { // لا تعيد الجلب إذا كان هناك جلب جاري
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
    refetch: handleRefetch, // استخدام دالة الـ refetch الجديدة
  );
}
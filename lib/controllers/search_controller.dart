// ignore_for_file: prefer_final_fields



import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodSearchController extends GetxController {
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  RxBool _isTriggered = false.obs;
  bool get isTriggered => _isTriggered.value;

  set setTrigger(bool value) {
    _isTriggered.value = value;
  }

  RxList<FoodsModel> searchResults = <FoodsModel>[].obs;

  // List<FoodsModel>? searchResults;

  RxString query = ''.obs;

  @override
  void onInit() {
    super.onInit();

    debounce(query, (value) {
      if (value.toString().isNotEmpty) {
        searchFoods(value);
        setTrigger = true;
      } else {
        searchResults.clear();
        setTrigger = false;
      }
    }, time: const Duration(milliseconds: 400));
  }

  void searchFoods(String key) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/api/foods/search/$key');

    try {
      var response = await http.get(url);
      debugPrint("🔹 API Response: ${response.body}");
      if (response.statusCode == 200) {
        searchResults.value = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
        debugPrint(error.message);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }

  
}

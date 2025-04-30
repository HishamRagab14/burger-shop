import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/success_model.dart';
import 'package:burger_shop_app/views/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final box = GetStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void registerFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/register');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 201) {
        var data = successModelFromJson(response.body);
        

        setLoading = false;

        Get.snackbar(
          "You have created an account",
          data.message,
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Icons.fastfood_outlined),
        );
        Get.to(() => MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar(
          "Failed to register , ${error.message}",
          "Please try again",
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

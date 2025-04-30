import 'dart:convert';

import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/login_response.dart';
import 'package:burger_shop_app/views/auth/widgets/verification_page.dart';
import 'package:burger_shop_app/views/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final box = GetStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void loginFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/login');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> map = json.decode(response.body);

        final LoginMainResponse mainResponse = LoginMainResponse.fromJson(map);

        final user = mainResponse.data;
        final token = mainResponse.userToken;

        box.write(user.id, json.encode(user.toJson()));
        box.write('token', token);
        box.write('userId', user.id);
        box.write('verification', user.verification);

        setLoading = false;

        Get.snackbar(
          "You have successfully logged in",
          "Welcome back",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Icons.fastfood_outlined),
        );

        if (user.verification == false) {
          return Get.offAll(
            () => const VerificationPage(),
            transition: Transition.fade,
            duration: Duration(milliseconds: 900),
          );
        }
        return Get.offAll(
          () => MainScreen(),
          transition: Transition.fade,
          duration: Duration(milliseconds: 900),
        );
      }
      final err = apiErrorFromJson(response.body);
      setLoading = false;
      Get.snackbar(
        "Failed to log in",
        err.message,
        colorText: kLightWhite,
        backgroundColor: kRed,
        icon: Icon(Icons.error_outline),
      );

      
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        colorText: kLightWhite,
        backgroundColor: kRed,
        icon: Icon(Icons.error_outline),
      );
    }
  }

  void logout() async {
    box.erase();
    Get.offAll(
      () => MainScreen(),
      transition: Transition.fade,
      duration: Duration(milliseconds: 900),
    );
  }

  LoginResponse? getUserInfo() {
    String? userId = box.read('userId');
    String? data;

    if (userId != null) {
      data = box.read(userId.toString());
    }

    if (data != null) {
      return loginResponseFromJson(data);
    }
    return null;
  }
}

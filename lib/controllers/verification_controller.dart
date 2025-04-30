// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/login_response.dart';
import 'package:burger_shop_app/views/auth/login/login_page.dart';
import 'package:burger_shop_app/views/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class VerificationController extends GetxController {
  final box = GetStorage();

  String _code = '';
  String get code => _code;
  set setCode(String value) {
    _code = value;
  }

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verificationFunction(String code) async {
    setLoading = true;
    final String? accessToken = box.read<String>('token');

    if (accessToken == null || accessToken.isEmpty) {
      setLoading = false;
      // إذا ما فيش توكن نرجع لصفحة الدخول
      Get.offAll(() => LoginPage());
      Get.snackbar(
        'Session expired',
        'Please log in again to verify your account.',
        colorText: kLightWhite,
        backgroundColor: kRed,
        icon: Icon(Icons.error_outline),
      );
      return;
    }

    Uri url = Uri.parse('$appBaseUrl/api/users/verify/$code');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);

        final mainResp = LoginMainResponse.fromJson(jsonMap);
        final loginData = mainResp.data;
        final newToken = mainResp.userToken;

        debugPrint('🥇 loginData.verification = ${loginData.verification}');
        debugPrint('🥇 loginData.id           = ${loginData.id}');

        box.write(loginData.id, json.encode(loginData.toJson()));
        box.write('token', newToken);
        box.write('userId', loginData.id);
        box.write('verification', loginData.verification);

        debugPrint('📦 stored verification = ${box.read('verification')}');
        debugPrint('📦 stored userData     = ${box.read(loginData.id)}');

        setLoading = false;

        Get.snackbar(
          "You have successfully verified your account",
          "Enjoy your meal",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Icons.fastfood_outlined),
        );

        Get.offAll(
          () => MainScreen(),
          transition: Transition.fade,
          duration: Duration(milliseconds: 900),
        );
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar(
          "Failed to verify , ${error.message}",
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
  
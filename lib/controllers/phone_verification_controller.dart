import 'dart:convert';
import 'dart:developer';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/api_error.dart';
import 'package:burger_shop_app/models/login_response.dart';
import 'package:burger_shop_app/views/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PhoneVerificationController extends GetxController {
  final box = GetStorage();
  String _phone = '';
  String get phone => _phone;
  set setPhoneNumber(String? value) {
    if (value != null) {
      _phone = value;
      log('Phone number set: $phone');
    }
  }

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) => _isLoading.value = value;

  Future<void> verifyPhone() async {
    if (_phone.isEmpty) {
      log("Phone number is empty, cannot verify backend.");
      Get.snackbar(
        'Error',
        'Phone number not set.',
        colorText: kLightWhite,
        backgroundColor: kRed,
        icon: const Icon(Icons.error_outline, color: kLightWhite),
      );
      return;
    }

    String phoneNumberForUrl = _phone.replaceAll('+', '');

    setLoading = true;
    String? accessToken = box.read('token');
    if (accessToken == null) {
      log("Access token is null. User might not be logged in properly.");
      setLoading = false;
      Get.snackbar(
        'Error',
        'Authentication token not found. Please log in again.',
        colorText: kLightWhite,
        backgroundColor: kRed,
        icon: const Icon(Icons.error_outline, color: kLightWhite),
      );
      return;
    }

    Uri url = Uri.parse('$appBaseUrl/api/users/verify_phone/$phoneNumberForUrl');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      var response = await http.post(url, headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);

        final mainResp = LoginMainResponse.fromJson(jsonMap);
        // final loginData = mainResp.data;
        // final newToken = mainResp.userToken;

        LoginResponse data = loginResponseFromJson(response.body);
        String userId = data.id;
        String userData = jsonEncode(data);
        box.write(userId, userData);
        box.write('token', mainResp.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        // box.write(loginData.id, json.encode(loginData.toJson()));
        // box.write('token', newToken);
        // box.write('userId', loginData.id);
        // box.write('verification', loginData.verification);

        setLoading = false;

        Get.snackbar(
          'You have successfully logged in',
          'Welcome back',
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Icons.fastfood_outlined),
        );
        Get.offAll(() => MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar(
          'Failed to login',
          'Please try again',
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: Icon(Icons.error_outline),
          messageText: Text(error.message),
        );
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}

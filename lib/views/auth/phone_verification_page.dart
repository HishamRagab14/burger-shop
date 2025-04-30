import 'dart:developer';

import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/phone_verification_controller.dart';
import 'package:burger_shop_app/services/verification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/phone_verification.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final VerificationService _verificationService = VerificationService();
  String _verificationId = '';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return BackgroundContainer(
      child: Obx(
        () =>
            controller.isLoading == false
                ? PhoneVerification(
                  isFirstPage: false,
                  enableLogo: false,
                  themeColor: kSecondary,
                  backgroundColor: Colors.transparent,
                  initialPageText: "Verify Phone Number",
                  initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
                  textColor: kDark,
                  onSend: (String value) {
                    controller.setPhoneNumber = value;
                    log('Phone number: $value');
                    _verifyPhoneNumber(value);
                  },
                  onVerification: (String value) {
                    log('OTP: $value');
                    _submitVerificationCode(value);
                  },
                )
                : const Center(child: CircularProgressIndicator() ),
      ),
    );
  }

  void _verifyPhoneNumber(String phoneNumber) async {
    await _verificationService.verifyPhoneNumber(
      phoneNumber,
      codeSent: (verificationId, resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _submitVerificationCode(String smsCode) async {
    await _verificationService.verifySmsCode(_verificationId, smsCode);
  }
}

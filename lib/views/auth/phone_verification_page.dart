import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../common/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: PhoneVerification(
        isFirstPage: false,
        enableLogo: false,
        themeColor: kSecondary,
        backgroundColor: Colors.transparent,
        initialPageText: "Verify Phone Number",
        initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
        textColor: kDark,
        onSend: (String value) {
          // print('Phone number: $value');
        },
        onVerification: (String value) {
          // print('OTP: $value');
        },
      ),
    );
  }
}

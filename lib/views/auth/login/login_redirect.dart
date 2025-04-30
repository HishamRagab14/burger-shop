import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/views/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ReusableText(
          text: 'Please login to access this page',
          style: appStyle(13, kDark, FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Lottie.asset(
            'assets/anime/deliverysign.json',
            // width: width,
            animate: false,
            height: 300.h,
            // height: height / 2,
          ),
          SizedBox(height: 80.h),
          CustomButton(
            buttonText: 'LOGIN',
            buttonColor: kPrimary,
            buttonHeight: 40.h,
            textStyle: appStyle(14, Colors.white, FontWeight.w500),

            onTap: () {
              Get.to(() => const LoginPage());
            },
          ),
        ],
      ),
    );
  }
}

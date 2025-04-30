import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: ReusableText(
          text: 'Please verify your account',
          style: appStyle(14, kDark, FontWeight.w600),
        ),
      ),
      body: CustomContainer(
        color: Colors.white,
        containerContent: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            height: height,
            child: ListView(
              padding: EdgeInsets.zero,

              children: [
                Lottie.asset('assets/anime/deliverysign.json',animate: false),
                SizedBox(height: 30.h),
                Center(
                  child: ReusableText(
                    text: 'Please Verify Your Account',
                    style: appStyle(16, kPrimary, FontWeight.w600),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: ReusableText(
                    text: 'Enter the 6-digit code sent to your email',
                    style: appStyle(12, kDark, FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10.h),

                OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimary,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  borderWidth: 2.0,
                  textStyle: appStyle(17, kDark, FontWeight.w600),
                  // showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    // print(verificationCode);
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       title: Text("Verification Code"),
                    //       content: Text('Code entered is $verificationCode'),
                    //     );
                    //   },
                    // );
                    
                    controller.setCode = verificationCode;
                  },
                ),

                SizedBox(height: 20.h),
                CustomButton(
                  buttonText: 'Verify Account',
                  buttonColor: kPrimary,
                  buttonHeight: 40.h,
                  textStyle: appStyle(14, Colors.white, FontWeight.w500),
                  onTap: () {
                    controller.verificationFunction(controller.code);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

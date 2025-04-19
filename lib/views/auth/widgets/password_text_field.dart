import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(() {
      return TextFormField(
        cursorColor: kDark,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your valid password';
          } else {
            return null;
          }
        },
        obscureText: passwordController.password,
        style: appStyle(12, kDark, FontWeight.normal),
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(CupertinoIcons.lock, size: 20, color: kGreyLight),

          suffixIcon: GestureDetector(
            onTap: (){
              passwordController.setPassword = !passwordController.password;
            },
            child: Icon(
              passwordController.password ? Icons.visibility : Icons. visibility_off,
              size: 20,
              color: kGreyLight,
            ),
          ),

          isDense: true,
          contentPadding: EdgeInsets.all(12.h),
          hintStyle: appStyle(12, kGrey, FontWeight.normal),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: .75),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),

          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kGrey, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: .75),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),

          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: .75),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
        ),
      );
    });
  }
}

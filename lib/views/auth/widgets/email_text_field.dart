import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onEditingComplete,
    this.keyboardType,
    this.initialValue,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
  });
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        } else {
          return null;
        }
      },
      obscureText: obscureText ?? false,
      style: appStyle(12, kDark, FontWeight.normal),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
  }
}

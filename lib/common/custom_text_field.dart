import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    this.controller,
    this.onEditingComplete,
    this.isObsecure,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.hintText,
    this.onChanged, this.maxLines,
  });
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function()? onEditingComplete;
  final bool? isObsecure;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final String? hintText;
  final Function(String)? onChanged;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.w),
      decoration: BoxDecoration(
        border: Border.all(color: kGrey, width: 1.5),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        maxLines: maxLines ?? 1, 
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        obscureText: isObsecure ?? false,
        cursorHeight: 20.h,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: appStyle(11, kDark, FontWeight.normal),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}

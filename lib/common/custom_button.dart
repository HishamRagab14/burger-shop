import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.buttonHeight,
    this.buttonWidth,
    this.borderRadius,
    this.buttonColor,
    required this.buttonText,
  });

  final void Function()? onTap;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? borderRadius;
  final Color? buttonColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight ?? 28.h,
        width: buttonWidth ?? width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 9.r),
          color: buttonColor,
        ),
        child: Center(
          child: ReusableText(
            text: buttonText,
            style: appStyle(12, kLightWhite, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

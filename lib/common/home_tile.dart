import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    this.onTap,
    required this.text,
    required this.iconName,
  });
  final Function()? onTap;
  final String text;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(iconName, width: 40.w, height: 40.h),
          ReusableText(text: text, style: appStyle(11, kGrey, FontWeight.w500)),
        ],
      ),
    );
  }
}

import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/views/home/main/restaurant/rating_page.dart';
import 'package:burger_shop_app/views/home/main/restaurant/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.widget,
  });

  final RestaurantPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
        color: kSecondary.withAlpha(60),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            itemCount: 5,
            rating: widget.restaurant!.rating,
            itemSize: 18.sp,
            itemBuilder:
                (context, index) =>
                    Icon(Icons.star, color: kSecondary, size: 2.sp),
          ),
    
          CustomButton(
            onTap: () {
              Get.to(()=>RatingPage());
            },
            buttonColor: kSecondary,
            buttonWidth: width / 3,
            buttonText: 'Rate ${widget.restaurant!.title}',
            textStyle: appStyle(
              12,
              kLightWhite,
              FontWeight.w500,
              text: 'Rate ${widget.restaurant!.title}',
            ),
          ),
        ],
      ),
    );
  }
}
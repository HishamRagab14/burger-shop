import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.time,
    required this.rating,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final double price;
  final String time;
  final double rating;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w,right: 0.w),
        child: Container(
          
          height: 191.h,
          width: width * 0.7.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kLightWhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8,right: 0.w),
                child: ClipRRect(
                  
                  borderRadius: BorderRadius.circular(16.r),
                  child: SizedBox(
                    height: 145.h,
                    width: width * 0.8.w,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: title,
                          style: appStyle(12, kDark, FontWeight.w500),
                        ),
                        ReusableText(
                          text: "${price.toString()} EGP",
                          style: appStyle(12, kDark, FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: 'Delivery Time',
                          style: appStyle(9, kGrey, FontWeight.w500),
                        ),
                        ReusableText(
                          text: time,
                          style: appStyle(9, kGrey, FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

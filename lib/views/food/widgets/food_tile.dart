import 'dart:developer';

import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/constants/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    log(food.toString());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: SizedBox(
                        width: 62.w,
                        height: 62.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                
                          child: Image.network(food.imageUrl!, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: food.title,
                          style: appStyle(14, Colors.black, FontWeight.w600),
                        ),
                        ReusableText(
                          text: 'Delivery Time : ${food.time}',
                          style: appStyle(12, Colors.black, FontWeight.w500),
                        ),
                        ReusableText(
                          text: food.price.toString(),
                          style: appStyle(12, Colors.black, FontWeight.w500),
                        ),
                        SizedBox(
                          height: 18.h,
                          width: width *0.6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: food.additives.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 5.w),
                                decoration: BoxDecoration(
                                  color: kSecondaryLight,
                                  borderRadius: BorderRadius.circular(9.r),
                                  ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                    child: ReusableText(
                                      text: food.additives[index].title,
                                      style: appStyle(10, kGrey, FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 5.w,
              top: 10.h,
              child: Container(
                width: 55.w,
                height: 19.h,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
                child: Center(
                  child: ReusableText(
                    text: food.price.toStringAsFixed(2),
                    style: appStyle(12, kLightWhite, FontWeight.bold),
                  ),
                )
            ))
          ],
        ),
      ),
    );
  }
}

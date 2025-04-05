import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});
  final FoodsModel food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Container(
        height: 84.h,
        decoration: BoxDecoration(
          color: kSecondary.withAlpha(76),
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
                          child: Image.network(food.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: food.title,
                          style: appStyle(13, kDark, FontWeight.w600,text: food.title),
                        ),
                        SizedBox(height: 2.h),
                        ReusableText(
                          text: 'Delivery Time : ${food.time}',
                          style: appStyle(11, kDark, FontWeight.w500,text: food.time),
                        ),
                        // ReusableText(
                        //   text: food.price.toString(),
                        //   style: appStyle(11, Colors.black, FontWeight.w500),
                        // ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          height: 18.h,
                          width: width *0.6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: food.additive.length,
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
                                      text: food.additive[index]['title'],
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
              right: 10.w,
              top: 10.h,
              child: Container(
                width: 75.w,
                height: 23.h,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
                child: Center(
                  child: ReusableText(
                    text: '${food.price.toStringAsFixed(2)} EGP',
                    style: appStyle(11, kLightWhite, FontWeight.bold),
                  ),
                )
            ),
            ),
            Positioned(
              top: 10.h,
              right: 90.w,
              child: Container(
                width: 21.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(MaterialCommunityIcons.cart_plus, size: 15.sp, color: kLightWhite,),
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}

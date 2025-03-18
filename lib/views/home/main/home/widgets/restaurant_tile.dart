// import 'dart:developer';
import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/constants/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurants});
  final Restaurant restaurants;
  // final String title;
  // // final String subtitle;
  // final String imageUrl;
  // final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.h),
            height: 100.h,
            width: width,
            decoration: BoxDecoration(
              color: kSecondary.withAlpha(76),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 80.h,
                          width: 70.w,
                          child: Image.asset(
                            restaurants.imageUrl!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   child: Container(
                        //     height: 16.h,
                        //     width: width,
                        //     padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                        //     color: kSecondary.withAlpha(153),
                        //     child: RatingBarIndicator(
                        //       rating: 5,
                        //       itemCount: 5,
                        //       itemSize: 15.h,
                        //       itemBuilder: (context, index) {
                        //         return Icon(Icons.star, color: kSecondary);
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: restaurants.name,
                        style: appStyle(13, kDark, FontWeight.w400),
                      ),
                      ReusableText(
                        text: 'Delivery time : ${restaurants.time}',
                        style: appStyle(11, kGrey, FontWeight.w400),
                      ),
                      ReusableText(
                        text: restaurants.coords.address,
                        style: appStyle(9, kGrey, FontWeight.w400),
                      ),
                      // SizedBox(height: 5.h),
                      SizedBox(
                        height: 16.h,
                        width: width * 0.5,
                        child: RatingBarIndicator(
                          rating: restaurants.rating,
                          itemCount: 5,
                          itemSize: 14.h,
                          itemBuilder: (context, index) {
                            return Icon(Icons.star, color: kSecondary);
                          },
                        ),
                      ),
                      ReusableText(
                        text:
                            '${restaurants.openingHours} : ${restaurants.closingHours}',
                        style: appStyle(9, kGrey, FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8.h,
            right: 10.w,
            child: Container(
              height: 19.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: restaurants.isOpen
                    ? kSecondary
                    : kGreyLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurants.isOpen ? 'Open' : 'Closed',
                  style: appStyle(12, kLightWhite, FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFirstAppBar extends StatelessWidget {
  const CustomFirstAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: kSecondary,
                    backgroundImage: AssetImage("assets/images/profile2.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: 'Deliver to',
                          style: appStyle(13, kSecondary, FontWeight.w600),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: width * 0.65,
                          child: Text(
                            "Shahabeya Street , Damietta",
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(12, kGreyLight, FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(getTimeOfDay(), style: TextStyle(fontSize: 30.sp),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return "🌞";
    } else if (hour >= 12 && hour < 18) {
      return "🌥️";
    } else {
      return '🌙';
    }
  }
}

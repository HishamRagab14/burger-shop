import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, this.user});
  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      color: kLightWhite,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 4, 16, 0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23.r,
              backgroundImage: NetworkImage(user!.profile),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableText(
                    text: user?.username ?? 'username',
                    style: appStyle(13, kDark, FontWeight.w500),
                  ),
                  ReusableText(
                    text: user?.email ?? 'hishamragab14@yahoo.com',
                    style: appStyle(11, kGrey, FontWeight.w600),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(Icons.edit,size: 20.sp,),
          ],
        ),
      ),
    );
  }
}

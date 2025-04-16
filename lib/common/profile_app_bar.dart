import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kOffWhite,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(AntDesign.logout, size: 18.h),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/egypt.png', width: 30.w, height: 30.h),
                SizedBox(width: 5.w),
                Container(width: 1.w, height: 18.h, color: kGreyLight),
                SizedBox(width: 5.w),
                ReusableText(
                  text: 'Egypt',
                  style: appStyle(14, kDark, FontWeight.normal),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Icon(SimpleLineIcons.settings, size: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

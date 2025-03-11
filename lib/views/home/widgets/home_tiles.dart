import 'package:burger_shop_app/common/home_tile.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 70.h,
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTile(text: 'Add Food', iconName: 'assets/icons/taco.svg'),
          HomeTile(text: 'Wallet', iconName: 'assets/icons/wallet.svg'),
          HomeTile(text: 'Foods', iconName: 'assets/icons/frenchfries.svg'),
          HomeTile(text: 'Self Deliveries', iconName: 'assets/icons/fooddelivery.svg'),
        ],
      ),
    );
  }
}
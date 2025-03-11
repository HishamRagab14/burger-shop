import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 25.h,
      width: width,
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: TabBar(
        tabs: orderList.map((e) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Tab(text: e),
        )).toList(),
        controller: tabController,
        indicator: BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.circular(25.r),
        ),
        labelStyle: appStyle(12, kLightWhite, FontWeight.bold),
        unselectedLabelStyle: appStyle(12, kGreyLight, FontWeight.w600),
        labelColor: kLightWhite,
        dividerColor: Colors.transparent,
        unselectedLabelColor: kGreyLight,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.zero,
      ),
    );
  }
}
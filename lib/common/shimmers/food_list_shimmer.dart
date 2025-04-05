import 'package:burger_shop_app/common/shimmers/shimmer_widget.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodListShimmer extends StatelessWidget {
  const FoodListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 10),
      height: 191.h,
      width: width * 0.7.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 8,right: 0.w),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerWidget(
            shimmerHeight: 70.h,
            shimmerWidth: width,
            shimmerRadius: 12,
          );
        },
      ),
    );
  }
}

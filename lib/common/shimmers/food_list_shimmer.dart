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
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
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

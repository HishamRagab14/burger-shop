import 'package:burger_shop_app/common/shimmers/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 10),
      height: 75.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerWidget(
            shimmerWidth: 70.w,
            shimmerHeight: 60.h,
            shimmerRadius: 12.r,
          );
        },
      ),
    );
  }
}

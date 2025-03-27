import 'package:burger_shop_app/common/shimmers/shimmer_widget.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyShimmer extends StatelessWidget {
  const NearbyShimmer({super.key});

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
            shimmerWidth: width * 0.8,
            shimmerHeight: 180.h,
            shimmerRadius: 12,
          );
        },
      ),
    );
  }
}
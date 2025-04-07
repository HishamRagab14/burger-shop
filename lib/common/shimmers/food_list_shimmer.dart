import 'package:burger_shop_app/common/shimmers/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodListShimmer extends StatelessWidget {
  const FoodListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( top: 10),
      height: 200.h,
      // width: width * 0.7.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0, right: 10 , left: 12),
            child: ShimmerWidget(
              shimmerHeight: 50.h,
              shimmerWidth: 250.w,
              shimmerRadius: 16.r,
            ),
          );
        },
      ),
    );
  }
}

// import 'package:burger_shop_app/common/shimmers/shimmer_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FoodListShimmer extends StatelessWidget {
//   const FoodListShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 110.h, 
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         padding: EdgeInsets.symmetric(horizontal: 12.w),
//         itemCount: 6,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 6.w),
//             child: ShimmerWidget(
//               shimmerHeight: 95.h, 
//               shimmerWidth: 160.w, 
//               shimmerRadius: 16.r,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


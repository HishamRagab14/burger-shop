// import 'package:burger_shop_app/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerWidget extends StatelessWidget {
//   const ShimmerWidget({
//     super.key,
//     required this.shimmerWidth,
//     required this.shimmerHeight,
//     required this.shimmerRadius,
//   });
//   final double shimmerWidth;
//   final double shimmerHeight;
//   final double shimmerRadius;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: shimmerWidth,
//       height: shimmerHeight,
//       padding: EdgeInsets.only(right: 12.0, top: 8.0),
//       child: _buildShimmerLine(height: shimmerHeight-20, width: shimmerWidth-15, radius: 20),
//     );
//   }
// }

// Widget _buildShimmerLine({
//   required double height,
//   required double width,
//   required double radius,}){
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: kSecondaryLight,
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(radius),
//         ),
//       ),
//     );

// }
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.shimmerWidth,
    required this.shimmerHeight,
    required this.shimmerRadius,
  });

  final double shimmerWidth;
  final double shimmerHeight;
  final double shimmerRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
      ), 
      child: _buildShimmerLine(
        height: shimmerHeight,
        width: shimmerWidth,
        radius: shimmerRadius,
      ),
    );
  }
}

Widget _buildShimmerLine({
  required double height,
  required double width,
  required double radius,
}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: kSecondaryLight,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

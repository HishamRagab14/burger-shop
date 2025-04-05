// import 'package:burger_shop_app/common/app_style.dart';
// import 'package:burger_shop_app/common/background_container.dart';
// import 'package:burger_shop_app/constants/constants.dart';
// import 'package:burger_shop_app/constants/uidata.dart';
// import 'package:burger_shop_app/views/food/widgets/food_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FoodList extends StatelessWidget {
//   const FoodList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kSecondary,
//       appBar: AppBar(
//         title: Text(
//           'Food List',
//           style: appStyle(18, kLightWhite, FontWeight.w600),
//         ),
//         backgroundColor: kSecondary,
//       ),
//       body: BackgroundContainer(
//         child: ListView.builder(
//           padding: EdgeInsets.only(top: 20.h),
//           itemCount: foods.length,
//           itemBuilder: (context, index) {
//             final food = foods[index];
//             return FoodTile(food: food,);
//           },
//         ),
//       ),
//     );
//   }
// }


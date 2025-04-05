// import 'package:burger_shop_app/common/background_container.dart';
// import 'package:burger_shop_app/common/custom_appbar.dart';
// import 'package:burger_shop_app/constants/constants.dart';
// import 'package:burger_shop_app/views/home/widgets/home_tabs.dart';
// import 'package:burger_shop_app/views/home/widgets/home_tiles.dart';
// import 'package:burger_shop_app/views/home/widgets/orders/new_orders.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   late TabController tabController = TabController(
//     length: orderList.length,
//     vsync: this,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kSecondary,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: kSecondary,
//         flexibleSpace: CustomAppbar(),
//       ),
//       body: BackgroundContainer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           physics: NeverScrollableScrollPhysics(),
//           children: [
//             SizedBox(height: 22.h),
//             HomeTiles(),
//             SizedBox(height: 8.h),
//             HomeTabs(tabController: tabController),
//             SizedBox(height: 8.h),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 12.w),
//               height: height * 0.7,
//               color: Colors.transparent,
//               child: TabBarView(
//                 controller: tabController,
//                 children: [
//                   NewOrders(),
//                   Container(color: Colors.red),
//                   Container(color: Colors.red),
//                   Container(color: Colors.red),
//                   Container(color: Colors.red),
//                   Container(color: Colors.red),
//                   Container(color: Colors.red),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

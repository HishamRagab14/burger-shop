import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/constants/uidata.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Nearby Restaurants',
          style: appStyle(16, kGrey, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        // child: RestaurantTile(restaurants: restaurants),
        child: ListView(
          padding: EdgeInsets.all(12.w),
          scrollDirection: Axis.vertical,
          children: List.generate(restaurants.length, (index) {
            var restaurant = restaurants[index];
            return RestaurantTile(
              restaurants: restaurant,
            );
          }),
        ),
        ),
      // body: ListView.builder(
      //   itemCount: restaurants.length,
      //   itemBuilder: (context, index) {
      //     return GestureDetector(
      //       onTap: onTap,
      //       child: ListTile(
      //         leading: Container(
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(12.r),
      //           ),
      //           child: Image.asset(
      //             restaurants[index].imageUrl!,
      //             fit: BoxFit.scaleDown,
      //           ),
      //         ),
      //         title: Text(
      //           restaurants[index].name,
      //           style: appStyle(14.sp, kDark, FontWeight.bold),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

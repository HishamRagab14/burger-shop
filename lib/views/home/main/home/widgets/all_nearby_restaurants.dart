import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/common/shimmers/nearby_shimmer.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/hooks/fetch_all_restaurants.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants();
    List<RestaurantsModel>? restaurants = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
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
        child: isLoading ? const NearbyShimmer() : ListView(
          // physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(12.w),
          scrollDirection: Axis.vertical,
          children: List.generate(restaurants!.length, (index) {
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

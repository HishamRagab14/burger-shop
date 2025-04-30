import 'package:burger_shop_app/common/shimmers/nearby_shimmer.dart';
import 'package:burger_shop_app/hooks/fetch_restaurants.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/restaurant_widget.dart';
import 'package:burger_shop_app/views/home/main/restaurant/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class NearbyRestaurantsList extends HookWidget {
  const NearbyRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("11211");
    List<RestaurantsModel>? restaurants = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
    return isLoading ? const NearbyShimmer() : Container(
      height: 205.h,
      padding: EdgeInsets.only(left: 4.w,),
      child:  ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants!.length, (index) {
          var restaurant = restaurants[index];
          return RestaurantWidget(
            onTap: () {
              Get.to((){
                return RestaurantPage(restaurant: restaurant,);
              });
            },
            imageUrl: restaurant.imageUrl,
            title: restaurant.title,
            time: restaurant.time,
            rating: restaurant.rating,
            ratingCount: restaurant.ratingCount,
          );
        }),
      ),
    );
  }
}

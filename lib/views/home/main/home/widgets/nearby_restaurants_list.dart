import 'package:burger_shop_app/constants/uidata.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantsList extends StatelessWidget {
  const NearbyRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205.h,
      padding: EdgeInsets.only(left: 4.w,),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (index) {
          var restaurant = restaurants[index];
          return RestaurantWidget(
            imageUrl: restaurant.imageUrl!,
            name: restaurant.name,
            time: restaurant.time.toString(),
            rating: restaurant.rating.toString(),
            ratingCount: restaurant.ratingCount.toInt(),
          );
        }),
      ),
    );
  }
}

import 'package:burger_shop_app/common/shimmers/vertical_food_list_shimmer.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/hooks/foods_by_restaurant.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantMenu extends HookWidget {
  const RestaurantMenu({super.key, required this.restaurantId,});
  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByRestaurant(restaurantId);
    final foods = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading?const VerticalFoodListShimmer(): SizedBox(
        height: height * 0.7,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
          children: List.generate(foods.length, (index) {
            final FoodsModel food = foods[index];
            return FoodTile(food: food, color: kLightWhite,);
          }),
        ),
      ),
    );
  }
}

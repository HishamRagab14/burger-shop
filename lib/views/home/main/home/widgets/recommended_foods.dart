import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/hooks/fetch_all_foods.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/views/food/widgets/food_tile.dart';
import 'package:burger_shop_app/common/shimmers/vertical_food_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedFoods extends HookWidget {
  const RecommendedFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007433");
    List<FoodsModel> foods = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Recommended Meals',
          style: appStyle(16, kLightWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        child:
            isLoading
                ? VerticalFoodListShimmer()
                : Padding(
                  padding: EdgeInsets.all(4.h),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: List.generate(foods.length, (index) {
                      // FoodsModel foods = foods[index];
                      return FoodTile(food: foods[index]);
                    }),
                  ),
                ),
      ),
    );
  }
}

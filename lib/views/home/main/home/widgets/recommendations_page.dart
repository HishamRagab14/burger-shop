import 'package:burger_shop_app/common/shimmers/food_list_shimmer.dart';
import 'package:burger_shop_app/hooks/fetch_all_foods.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationsList extends HookWidget {
  const RecommendationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007433");
    List<FoodsModel>? foods = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
    return Container(
      height: 191.h,
      padding: EdgeInsets.only(left: 4.w, top: 10.h,right: 2.w),
      child: isLoading ? const FoodListShimmer() : ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods!.length, (index) {
          FoodsModel food = foods[index];
          return FoodWidget(
            imageUrl: food.imageUrl,
            title: food.title,
            price: food.price,
            time: food.time,
            rating: food.rating,
          );
        }),
      ),
    );
  }
}

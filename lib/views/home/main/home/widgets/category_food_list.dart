import 'package:burger_shop_app/common/shimmers/vertical_food_list_shimmer.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/hooks/fetch_category_foods.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class CategoryFoodList extends HookWidget {
//   const CategoryFoodList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<CategoryController>();
//     final hookResult = useFetchFoodsByCategory(controller.categoryValue);
//     List<FoodsModel>? foods = hookResult.data;
//     final isLoading = hookResult.isLoading;
//     return SizedBox(
//       height: height,
//       width: width,
//       child:
//           isLoading
//               ? const VerticalFoodListShimmer()
//               : Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListView(
//                   children: List.generate(foods!.length, (index) {
//                     FoodsModel food = foods[index];
//                     return FoodTile(food: food);
//                   }),
//                 ),
//               ),
//     );
//   }
// }

// class CategoryFoodList extends HookWidget {
//   const CategoryFoodList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<CategoryController>();
//     final hookResult = useFetchFoodsByCategory(
//       controller.categoryValue,
//     );
//     List<FoodsModel>? foods = hookResult.data;
//     final isLoading = hookResult.isLoading;

//     return SizedBox(
//       height: height,
//       width: width,
//       child:
//           isLoading
//               ? const VerticalFoodListShimmer()
//               : Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListView(
//                   children: List.generate(foods!.length, (index) {
//                     FoodsModel food = foods[index];
//                     return FoodTile(food: food);
//                   }),
//                 ),
//               ),
//     );
//   }
// }

class CategoryFoodList extends HookWidget {
  const CategoryFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoodsByCategory(); 
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;

    return SizedBox(
      height: height,
      width: width,
      child: isLoading
          ? const VerticalFoodListShimmer()
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: List.generate(foods!.length, (index) {
                  FoodsModel food = foods[index];
                  return FoodTile(
                    food: food,
                    color: Colors.white,
                    );
                }),
              ),
            ),
    );
  }
}


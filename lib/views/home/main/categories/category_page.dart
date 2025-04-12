import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/common/shimmers/vertical_food_list_shimmer.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/category_controller.dart';
import 'package:burger_shop_app/hooks/fetch_category_foods.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    final hookResult = useFetchFoodsByCategory();
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.titleValue,
          style: appStyle(17, kLightWhite, FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: (){
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,color: kDark,),
        ),
        backgroundColor: kSecondary,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: SizedBox(
          // padding: EdgeInsets.only(left: 8.w, top: 5.h),
          height: height,
          child:
              isLoading
                  ? VerticalFoodListShimmer()
                  : Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListView(
                      children: List.generate(foods!.length, (index) {
                        FoodsModel food = foods[index];
                        return FoodTile(food: food, color: Colors.white);
                      }),
                    ),
                  ),
        ),
      ),
    );
  }
}

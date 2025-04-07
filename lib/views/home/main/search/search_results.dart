import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/search_controller.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/views/food/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(FoodSearchController());
    final controller = Get.find<FoodSearchController>();

    
    return Obx(() {
      return Container(
        padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
        height: height,
        child: ListView.builder(
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            FoodsModel foods = controller.searchResults[index];
            return FoodTile(food: foods, color: kOffWhite);
          },
        ),
      );
    });
  }
}

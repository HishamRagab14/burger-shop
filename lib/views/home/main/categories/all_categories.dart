import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/common/shimmers/food_list_shimmer.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/hooks/fetch_all_categories.dart';
import 'package:burger_shop_app/models/categories_model.dart';
import 'package:burger_shop_app/views/home/main/categories/widgets/category_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'All Categories',
          style: appStyle(18, kGrey, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 5.h),
          height: height,
          child: isLoading?FoodListShimmer(): ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories!.length, (index) {
              var category = categories[index];
              return Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: CategoryListTile(category: category),
              );
            }),
          ),
        ),
      ),
    );
  }
}
import 'package:burger_shop_app/common/shimmers/categories_shimmer.dart';
import 'package:burger_shop_app/hooks/fetch_categories.dart';
import 'package:burger_shop_app/models/categories_model.dart';
import 'package:burger_shop_app/views/home/main/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return isLoading
        ? CategoriesShimmer()
        : hookResult.data != null
        ? Container(
          height: 95.h,
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(categoriesList!.length, (index) {
              CategoriesModel category = categoriesList[index];
              return CategoryWidget(category: category);
            }),
          ),
        )
        : const Center(child: CircularProgressIndicator());
  }
}

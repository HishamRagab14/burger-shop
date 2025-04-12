import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/category_controller.dart';
import 'package:burger_shop_app/models/categories_model.dart';
import 'package:burger_shop_app/views/home/main/categories/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.title == 'More'  || 
             category.value == 'More') {
          Get.to(
            () {
              return const AllCategories();
            },
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900),
          );
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(() {
        return Container(
          margin: EdgeInsets.only(right: 6.w),
          padding: EdgeInsets.only(top: 8.h),
          width: width * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color:
                  controller.categoryValue == category.id.toString()
                      ? kSecondary
                      : kOffWhite,
              width: .5.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Image.network(
                category.imageUrl,
                height: 50.h,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(height: 5.h),
              ReusableText(
                text: category.title,
                style: appStyle(
                  11,
                  kDark,
                  FontWeight.normal,
                  text: category.title,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

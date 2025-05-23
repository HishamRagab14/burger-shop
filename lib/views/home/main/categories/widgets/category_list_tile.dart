import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/category_controller.dart';
import 'package:burger_shop_app/models/categories_model.dart';
import 'package:burger_shop_app/views/home/main/categories/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(() {
          return const CategoryPage();
        });
      },
      horizontalTitleGap: 25.w,
      // contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24.r,
        backgroundColor: kGreyLight,
        backgroundImage: NetworkImage(category.imageUrl),
      ),
      title: ReusableText(
        text: category.title,
        style: appStyle(13, Colors.black45, FontWeight.w500),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 15.sp,
        color: kGrey,
      ),
    );
  }
}

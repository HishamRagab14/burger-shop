import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/constants/uidata.dart';
import 'package:burger_shop_app/views/home/main/categories/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    super.key,
    required this.category,
  });

  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() {
          return const CategoryPage();
        });
      },
      horizontalTitleGap: 25.w,
      // contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: kGreyLight,
        backgroundImage: AssetImage(category.imageUrl!),
      ),
      title: ReusableText(
        text: category.title,
        style: appStyle(12, Colors.black45, FontWeight.w500),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 15.sp,
        color: kGrey,
      ),
    );
  }
}

import 'package:burger_shop_app/constants/uidata.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 191.h,
      padding: EdgeInsets.only(left: 4.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (index) {
          var food = foods[index];
          return FoodWidget(
            imageUrl: food.imageUrl!,
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

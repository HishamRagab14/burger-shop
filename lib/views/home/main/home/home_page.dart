import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/common/custom_first_app_bar.dart';
import 'package:burger_shop_app/common/heading.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/all_nearby_restaurants.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/all_fastest_food.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/recommendations_page.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/nearby_restaurants_list.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/recommended_foods.dart';
import 'package:burger_shop_app/views/home/main/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomFirstAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoryList(),
              
              Heading(
                onTap: () {
                  Get.to(
                    () {
                      return const RecommendedFoods();
                    },
                    transition: Transition.cupertino,
                    duration: Duration(milliseconds: 900),
                  );
                },
                text: 'Try Something New',
              ),
              RecommendationsList(),

              Heading(
                onTap: () {
                  Get.to(
                    () {
                      return AllNearbyRestaurants();
                    },
                    transition: Transition.cupertino,
                    duration: Duration(milliseconds: 900),
                  );
                },
                text: 'Nearby Restaurants',
              ),
              NearbyRestaurantsList(),
              Heading(
                onTap: () {
                  Get.to(
                    () {
                      return const AllFastestFood();
                    },
                    transition: Transition.cupertino,
                    duration: Duration(milliseconds: 900),
                  );
                },
                text: 'Food Closer To You',
              ),
              RecommendationsList(),
            ],
          ),
        ),
      ),
    );
  }
}

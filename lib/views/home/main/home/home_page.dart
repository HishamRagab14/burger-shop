import 'package:burger_shop_app/common/custom_appbar.dart';
import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/common/heading.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/category_controller.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/all_nearby_restaurants.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/all_fastest_food.dart';
import 'package:burger_shop_app/views/home/main/home/widgets/category_food_list.dart';
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
    final controller = Get.find<CategoryController>();
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: CustomAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoryList(),
              SizedBox(height: 10.h),

              Obx(
                () =>
                    controller.categoryValue == ''
                        ? Column(
                          children: [
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
                            SizedBox(height: 5.h),
                            RecommendationsList(),

                            SizedBox(height: 10.h),

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
                            SizedBox(height: 5.h),
                            NearbyRestaurantsList(),
                            SizedBox(height: 10.h),
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
                            SizedBox(height: 5.h),
                            RecommendationsList(),
                            SizedBox(height: 20.h),
                          ],
                        )
                        : CustomContainer(
                          containerContent: Column(
                            children: [
                              Heading(
                                more: true,
                                onTap: () {
                                  Get.to(
                                    () {
                                      return const RecommendedFoods();
                                    },
                                    transition: Transition.cupertino,
                                    duration: Duration(milliseconds: 900),
                                  );
                                },
                                text: 'Explore ${controller.titleValue} ',
                              ),
                              CategoryFoodList(),
                            ],
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

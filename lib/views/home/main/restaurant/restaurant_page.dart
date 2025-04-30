// ignore_for_file: unused_field, prefer_final_fields

import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:burger_shop_app/views/home/main/restaurant/directions_page.dart';
import 'package:burger_shop_app/views/home/main/restaurant/widgets/explore_widget.dart';
import 'package:burger_shop_app/views/home/main/restaurant/widgets/restaurant_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/route_manager.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    if (widget.restaurant != null) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kLightWhite,
          body: ListView(
            padding: EdgeInsets.only(top: 15),
            children: [
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 110.r,
                      backgroundColor: Colors.transparent,
                      // child: CachedNetworkImage(
                      //   fit: BoxFit.scaleDown,
                      //   imageUrl: widget.restaurant!.imageUrl,
                      // ),
                      backgroundImage: CachedNetworkImageProvider(
                        widget.restaurant?.imageUrl ?? '',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Ionicons.chevron_back_circle,
                              color: kGrey,
                              size: 28.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => DirectionsPage());
                            },
                            child: Icon(
                              Ionicons.location,
                              color: kPrimary,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10.h),
              // RestaurantBottomBar(widget: widget),
              SizedBox(height: 10.h),

              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4),
                  height: 120.h,
                  width: width * 0.8.w,
                  decoration: BoxDecoration(
                    color: kSecondary.withAlpha(76),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              widget.restaurant?.imageUrl ?? '',
                            ),
                            radius: 30.r,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 4.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  text: widget.restaurant?.title ?? '',
                                  style: appStyle(13, kDark, FontWeight.w600),
                                ),
                                SizedBox(height: 5.h),
                                Container(
                                  // height: ,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                  ),
                                  width: width * 0.2.w,
                                  decoration: BoxDecoration(
                                    color: kGreyLight.withAlpha(100),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.star, color: kSecondary),

                                      ReusableText(
                                        text:
                                            widget.restaurant?.rating
                                                .toString() ??
                                            '',
                                        style: appStyle(
                                          10,
                                          kDark,
                                          FontWeight.w400,
                                        ),
                                      ),
                                      ReusableText(
                                        text:
                                            '${widget.restaurant?.ratingCount}+',
                                        style: appStyle(
                                          10,
                                          kGrey,
                                          FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    ReusableText(
                                      text: 'Estimated Delivery Time : ',
                                      style: appStyle(
                                        10,
                                        kDark,
                                        FontWeight.w500,
                                      ),
                                    ),
                                    ReusableText(
                                      text: widget.restaurant?.time ?? '',
                                      style: appStyle(
                                        10,
                                        kDark,
                                        FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ReusableText(
                                      text: 'Estimated Delivery Fee : ',
                                      style: appStyle(
                                        10,
                                        kDark,
                                        FontWeight.w500,
                                      ),
                                    ),
                                    ReusableText(
                                      text: '35 EGP',
                                      style: appStyle(
                                        10,
                                        kDark,
                                        FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: kSecondary),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Container(
                  height: 35.h,
                  width: width,
                  decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    labelPadding: EdgeInsets.zero,
                    labelColor: kLightWhite,
                    labelStyle: appStyle(12, kLightWhite, FontWeight.w500),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: width / 2,
                          height: 25.h,
                          child: Center(child: Text('Menu')),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: width / 2,
                          height: 25.h,
                          child: Center(child: Text('Explore')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  height: height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      RestaurantMenu(restaurantId: widget.restaurant?.id ?? ''),
                      ExploreWidget(code: widget.restaurant?.code ?? ''),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Text(
          'No restaurant data available!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:burger_shop_app/views/home/main/restaurant/widgets/restaurant_bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            CircleAvatar(
              radius: 120.r,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: widget.restaurant!.imageUrl,
              ),
            ),
            SizedBox(height: 10.h),
            RestaurantBottomBar(widget: widget),
          ],
        ),
      ),
    );
  }
}


import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.3,
        title: Text('Nearby Restaurants',
        style: appStyle(16, kGrey, FontWeight.w600),
        ),
      ),
      body: Center(
        child: Text('All Nearby Restaurants'),),
    );
  }
}
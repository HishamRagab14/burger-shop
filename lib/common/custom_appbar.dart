import 'dart:developer';

import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/user_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  void initState() {
    super.initState();
    log("CustomAppbar initState: Calling _determinePosition...");
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    return Container(
      width: width,
      height: 100.h,
      padding: EdgeInsets.fromLTRB(12.w, 40.h, 12.w, 0.h),
      color: kSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/profile2.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: "The Burger Shop",
                      style: appStyle(14, Colors.white, FontWeight.bold),
                    ),
                    Obx(
                      () => SizedBox(
                        width: width * 0.65,
                        child: ReusableText(
                          text: controller.address,
                          style: appStyle(12, Colors.white, FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/restaurantopen.svg',
            width: 40.w,
            height: 40.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Future<void> _determinePosition() async {
    log("_determinePosition: Checking location service...");
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      log("_determinePosition: Location services are disabled. Exiting.");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      log("_determinePosition: Permission denied, requesting...");
      permission = await Geolocator.requestPermission();
      // log("_determinePosition: Permission After Request = $permission");
      if (permission == LocationPermission.denied) {
        log("_determinePosition: Permission denied after request. Exiting.");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("_determinePosition: Permission denied forever. Exiting.");
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final controller = Get.find<UserLocationController>();
    log("_getCurrentLocation: Attempting to get current position...");
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.best),
      );
      log("_getCurrentLocation: Position obtained successfully.");
      // LatLng currentLocation = LatLng(position.latitude, position.longitude);
      LatLng currentLocation = LatLng(31.427283, 31.809867);
      log(">>>> Location Received from Geolocator: $currentLocation");
      controller.setPosition(currentLocation);
      controller.getUserAddress(currentLocation);
    } catch (e) {
      log("❌❌❌ Error getting current location: $e");
    }
  }
}

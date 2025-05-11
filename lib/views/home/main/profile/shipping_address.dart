import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:burger_shop_app/common/app_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/user_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late final PageController _pageController = PageController(initialPage: 0);
  final Completer<GoogleMapController> _mapControllerCompleter =
      Completer<GoogleMapController>();
  List<dynamic> _placeList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _mapControllerCompleter.future
        .then((controller) {
          controller.dispose();
        })
        .catchError((e) {
          log(
            "خطأ أثناء التخلص من controller الخريطة (قد لا يكون تم إنشاؤه): $e",
          );
        });
    _pageController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchQuery&key=$googleApiKey',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      }
    } else {
      _placeList = [];
    }
  }

  void _getPlaceDetails(String placeId) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleApiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final placeDetails = json.decode(response.body)['result'];
      log(placeDetails.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserLocationController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondary,
        elevation: 0,
        title: Text('Shipping Address'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          pageSnapping: false,
          onPageChanged: (index) {
            log("Page changed to: $index");
          },
          children: [
            Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: controller.position,
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('Your Location'),
                      position: controller.position,
                      draggable: true,
                      onDragEnd: (LatLng position) {
                        controller.getUserAddress(position);
                        log(">>>> Marker Dragged to: $position");
                        log(controller.address);
                      },
                    ),
                  },
                  onMapCreated: (GoogleMapController controller) {
                    if (!_mapControllerCompleter.isCompleted) {
                      _mapControllerCompleter.complete(controller);
                    }
                  },
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      color: Colors.white,
                      child: TextField(
                        controller: _searchController,
                        onChanged: _onSearchChanged,
                        decoration: InputDecoration(
                          hintText: 'Search for your location',
                        ),
                      ),
                    ),
                    _placeList.isEmpty
                        ? const SizedBox.shrink()
                        : ListView(
                          children: List.generate(_placeList.length, (index) {
                            return Container(
                              color: Colors.white,
                              child: ListTile(
                                visualDensity: VisualDensity.compact,
                                title: Text(
                                  _placeList[index]['description'],
                                  style: appStyle(
                                    14,
                                    kGreyLight,
                                    FontWeight.w400,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            );
                          }),
                        ),
                  ],
                ),
              ],
            ),
            Container(color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:burger_shop_app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController {
  LatLng position = const LatLng(0, 0);

  void setPosition(LatLng value) {
    position = value;
    update();
  }

  final RxString _address = ''.obs;
  String get address => _address.value;
  set setAddress(String value) {
    _address.value = value;
  }

  final RxString _postalCode = ''.obs;
  String get postalCode => _postalCode.value;
  set setPostalCode(String value) {
    _postalCode.value = value;
  }

  void getUserAddress(LatLng position) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey',
    );
    log(
      "Requesting Geocoding URL: ${url.toString()}",
    ); // Log the URL being requested

    final response = await http.get(url);
    log(
      "Geocoding Response HTTP Status Code: ${response.statusCode}",
    ); // Log HTTP status
    log("Geocoding Raw Response Body: ${response.body}"); // <-- LOG THIS!!!

    if (response.statusCode == 200) {
      try {
        final responseBody = jsonDecode(response.body);

        // Check the status INSIDE the JSON
        if (responseBody['status'] == 'OK' &&
            responseBody['results'] is List &&
            responseBody['results'].isNotEmpty) {
          log("Geocoding Internal Status OK and results are not empty.");
          final address = responseBody['results'][0]['formatted_address'];
          setAddress = address;
          // ... rest of parsing ...
        } else {
          // Log the INTERNAL status if not 'OK' or results empty
          log(
            "Geocoding failed or returned empty results. Internal Status: ${responseBody['status']}",
          );
          setAddress = "No address found for coordinates";
          setPostalCode = "";
        }
      } catch (e) {
        log("Error processing Geocoding JSON: $e");
        setAddress = "Error getting address details";
        setPostalCode = "";
      }
    } else {
      log("Geocoding HTTP request failed.");
      setAddress = "Error connecting to geocoder service";
      setPostalCode = "";
    }
  }
}

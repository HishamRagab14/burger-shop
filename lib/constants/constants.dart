import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

String googleApiKey = '';
const kPrimary = Color(0xff30b9b2);
const kPrimaryLight = Color(0xff40FEF3);
const kSecondary = Color(0xFFFFa44f);
const kSecondaryLight = Color(0xffFFe5Db);
const kTertiary = Color(0xff0078db);
const kGrey = Color(0xff89829A);
const kGreyLight = Color(0xffc1c0c8);
const kLightWhite = Color(0xffFAFAFC);
const kWhite = Color(0xffFFFFFF);
const kDark = Color(0xff000000);
const kRed = Color(0xffe81e4d);
const kOffWhite = Color(0xffF3F4F8);
double height = 826.90.h;
double width = 392.72.w;

// const String appBaseUrl = "http://localhost:6013";
// In constants.dart
const String appBaseUrl = "http://10.0.2.2:6013"; // For Android emulator
// OR
// const String appBaseUrl = "http://127.0.0.1:6013"; // For iOS simulator


List<String> orderList= [
  'New Orders',
  'Preparing',
  'Ready',
  'Picked Up',
  'On the way',
  'Delivered',
  'Cancelled'
];

final List<String> verificationReasons = [
  'Real-time Updates: Get instant notifications about your order status, including tracking updates and delivery progress.',
  'Direct Communication: Stay connected with the restaurant and receive real-time updates on your order.',
  'Enhanced Security: Your privacy and security are our top priority. Our secure system ensures that your information is protected at all times.',
  'Effortless Rescheduling: Easily reschedule or cancel your order online, saving you time and effort.',
  'Exclusive Offers: Receive exclusive offers, discounts, and special deals that you won\'t find anywhere else.',
];



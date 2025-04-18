import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.only(bottom: 180),
        child: LottieBuilder.asset(
          'assets/anime/delivery.json',
          width: width,
          height: height / 2,
        ),
      ),
    );
  }
}

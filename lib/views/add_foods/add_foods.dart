import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AddFoods extends StatelessWidget {
  const AddFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: 'Welcome To The Burger Shop',
              style: appStyle(14, kLightWhite, FontWeight.w600),
            ),
            ReusableText(
              text: 'Fill All The Required Fields To Add A New Food',
              style: appStyle(12, kLightWhite, FontWeight.normal),
            ),
          ],
        ),
      ),
      body: BackgroundContainer(
        child: ListView(
          children: [
            SizedBox(
              height: height,
              width: width,
              // child: ,
            )
          ],
        ),
        ),
    );
  }
}

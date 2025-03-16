import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Container(),
      ),
      body: SafeArea(child: CustomContainer(containerContent: Container())),
    );
  }
}
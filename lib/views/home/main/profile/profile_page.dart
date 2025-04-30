import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/controllers/login_controller.dart';
import 'package:burger_shop_app/models/login_response.dart';
import 'package:burger_shop_app/views/auth/login/login_page.dart';
import 'package:burger_shop_app/views/auth/login/login_redirect.dart';
import 'package:burger_shop_app/views/auth/widgets/verification_page.dart';
import 'package:burger_shop_app/views/home/main/profile/widgets/profile_app_bar.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/views/home/main/profile/widgets/profile_tile_widget.dart';
import 'package:burger_shop_app/views/home/main/profile/widgets/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();
    String? token = box.read('token');

    debugPrint('📦 Box keys: ${box.getKeys()}');
    debugPrint('📦 Separate flag: ${box.read<bool>("verification")}');

    if (token == null) {
      return LoginRedirect();
    }
    user = controller.getUserInfo();
    debugPrint('🍔 token = $token');
    debugPrint('🍔 user = $user');
    debugPrint('🍔 user.verification = ${user?.verification}');

    if (user == null || user.email == '') {
      return LoginRedirect();
    }

    if (user.verification == false) {
      return const VerificationPage();
    }

    // if (token != null) {
    //   user = controller.getUserInfo();
    //   // print(user!.email);
    // }

    // if (user != null && user.verification == false) {
    //   return const VerificationPage();
    // }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              UserInfoWidget(user: user),
              SizedBox(height: 20.h),

              Container(
                height: 180.h,
                decoration: BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                      title: 'My Orders',
                      icon: Ionicons.fast_food_outline,
                      onTap: () {},
                    ),
                    ProfileTileWidget(
                      title: 'My Favorite Places',
                      icon: Ionicons.heart_outline,
                      onTap: () {},
                    ),
                    ProfileTileWidget(
                      title: 'Reviews',
                      icon: Ionicons.chatbubble_outline,
                      onTap: () {},
                    ),
                    ProfileTileWidget(
                      title: 'Coupons',
                      icon: MaterialCommunityIcons.tag_outline,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Container(
                height: 180.h,
                decoration: BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                      title: 'Shipping Address',
                      icon: SimpleLineIcons.location_pin,
                      onTap: () {},
                    ),
                    ProfileTileWidget(
                      title: 'Service Center',
                      icon: AntDesign.customerservice,
                      onTap: () {},
                    ),
                    ProfileTileWidget(
                      title: 'App Feedback',
                      icon: MaterialIcons.rss_feed,
                      onTap: () {},
                    ),
                    ProfileTileWidget(
                      title: 'Settings',
                      icon: AntDesign.setting,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                buttonText: 'LogOut',
                buttonColor: kRed,
                buttonHeight: 40.h,
                borderRadius: 30.r,
                buttonWidth: width * 0.8,
                onTap: () {
                  controller.logout();
                  Get.to(() => LoginPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

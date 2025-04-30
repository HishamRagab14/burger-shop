import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/login_controller.dart';
import 'package:burger_shop_app/models/login_response.dart';
import 'package:burger_shop_app/views/auth/login/login_redirect.dart';
import 'package:burger_shop_app/views/auth/widgets/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final controller = Get.put(LoginController());
    String? token = box.read('token');

    
    LoginResponse? user;

    if(token != null) {
      user = controller.getUserInfo();
    }

    if(token == null) {
      return LoginRedirect();
    }
    
    if(user != null && user.verification == false) {
      return const VerificationPage(); 
      
    }
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
import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/controllers/login_controller.dart';
import 'package:burger_shop_app/models/login_model.dart';
import 'package:burger_shop_app/views/auth/widgets/email_text_field.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/views/auth/register/register_page.dart';
import 'package:burger_shop_app/views/auth/widgets/password_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Text(
           'Food Shop',
          style: appStyle(20, kLightWhite, FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30.h),
              Lottie.asset(
                'assets/anime/deliverysign.json',
                width: width,
                animate: true,
                height: 200.h,
                // height: height / 2,
              ),
              SizedBox(height: 40.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Email Address',
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 20,
                        color: kGreyLight,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(height: 20.h),
                    PasswordTextField(controller: _passwordController),

                    SizedBox(height: 60.h),
                    CustomButton(
                      buttonText: 'LOGIN',
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 7) {
                          LoginModel model = LoginModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          String data = loginModelToJson(model);
                          controller.loginFunction(data);
                        }
                      },
                      buttonColor: kPrimary,
                      buttonHeight: 40.h,
                      textStyle: appStyle(14, Colors.white, FontWeight.w500),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          text: 'Don\'t have an account?  ',
                          style: appStyle(11, kGrey, FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const RegisterPage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 900),
                            );
                          },
                          child: ReusableText(
                            text: 'Register',
                            style: appStyle(11, kPrimary, FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

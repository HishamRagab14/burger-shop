import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/background_container.dart';
import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/controllers/register_controller.dart';
import 'package:burger_shop_app/models/registration_model.dart';
import 'package:burger_shop_app/views/auth/widgets/email_text_field.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/views/auth/login/login_page.dart';
import 'package:burger_shop_app/views/auth/widgets/password_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _userController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(
            text: 'Food Shop',
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
        ),
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
              SizedBox(height: 30.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Username',
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                        color: kGreyLight,
                      ),
                      controller: _userController,
                    ),
                    SizedBox(height: 20.h),
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
                    SizedBox(height: 40.h),
                    CustomButton(
                      buttonText: 'REGISTER',
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _userController.text.isNotEmpty &&
                            _passwordController.text.length >= 7) {
                          RegistrationModel model = RegistrationModel(
                            username: _userController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          String data = registrationModelToJson(model);
                          controller.registerFunction(data);
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
                          text: 'Already have an account?  ',
                          style: appStyle(11, kGrey, FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const LoginPage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 900),
                            );
                          },
                          child: ReusableText(
                            text: 'Login',
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

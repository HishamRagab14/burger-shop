import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/custom_button.dart';
import 'package:burger_shop_app/common/custom_text_field.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
// import 'package:burger_shop_app/controllers/food_controller.dart';
import 'package:burger_shop_app/hooks/fetch_restaurant.dart';
import 'package:burger_shop_app/models/foods_model.dart';
import 'package:burger_shop_app/models/hook_models/additive_obs.dart';
import 'package:burger_shop_app/views/auth/phone_verification_page.dart';
import 'package:burger_shop_app/views/home/main/home/home_page.dart';
import 'package:burger_shop_app/views/home/main/restaurant/restaurant_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controllers/food_controller.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});
  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final FoodController controller = Get.put(FoodController());

  final RxInt localQuantity = 1.obs;

  @override
  void initState() {
    super.initState();
    // controller.loadAdditives(widget.food.additive);

    final initialAdditives =
        widget.food.additive
            .map(
              (m) => AdditiveObs(
                id: m['id'] ?? 0,
                title: m['title'] ?? '',
                price: (m['price'] ?? 0).toString(),
                checked: false,
              ),
            )
            .toList();
    controller.initialize(widget.food.price, initialAdditives);

    // WidgetsBinding.instance.addPostFrameCallback((_) {

    //   controller.loadAdditives(widget.food.additive);
    //   controller.initializeFoodPrice(widget.food.price * localQuantity.value);
    // });
    // controller.updateTotalPrice(price: widget.food.price);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController requestController = useTextEditingController();
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    // controller.initializeFoodPrice(widget.food.price * localQuantity.value);

    // final controller = Get.put(FoodController());
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r),
                ),
                child: SizedBox(
                  height: 240.h,
                  width: width,
                  child: CachedNetworkImage(
                    imageUrl: widget.food.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 44.h,
                left: 14.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => HomePage());
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: kPrimary,
                    size: 22,
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                right: 12.w,
                child: CustomButton(
                  onTap: () {
                    Get.to(() => RestaurantPage(restaurant: hookResult.data));
                  },
                  buttonWidth: 105.w,
                  buttonColor: kPrimary,
                  buttonText: 'Restaurant',
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: widget.food.title,
                      style: appStyle(18, kDark, FontWeight.w600),
                    ),
                    Obx(
                      () => ReusableText(
                        text:
                            "${controller.totalPrice.value.toStringAsFixed(2)} EGP",
                        style: appStyle(18, kPrimary, FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                Text(
                  widget.food.description,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: appStyle(13, kGrey, FontWeight.w400),
                ),
                SizedBox(height: 20.h),

                SizedBox(
                  height: 20.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(widget.food.foodTags.length, (
                      index,
                    ) {
                      final tag = widget.food.foodTags[index];
                      return Container(
                        margin: EdgeInsets.only(right: 6.w),
                        decoration: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: ReusableText(
                              text: tag,
                              style: appStyle(10, kWhite, FontWeight.w400),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 15.h),
                ReusableText(
                  text: 'Additives and Toppings',
                  style: appStyle(16, kDark, FontWeight.w600),
                ),
                SizedBox(height: 8.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(controller.additivesList.length, (
                    index,
                  ) {
                    final additive = controller.additivesList[index];

                    return Obx(() {
                      return Column(
                        children: [
                          CheckboxListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                            ),
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            checkColor: kWhite,
                            activeColor: kSecondary,
                            tristate: false,
                            value: additive.isChecked.value,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReusableText(
                                  text: additive.title,
                                  style: appStyle(12, kDark, FontWeight.w400),
                                ),
                                SizedBox(width: 8.w),
                                ReusableText(
                                  text:
                                      additive
                                          .price, // Access price from AdditiveObs
                                  style: appStyle(13, kDark, FontWeight.w400),
                                ),
                              ],
                            ),

                            // onChanged: (bool? value) {
                            //   additive.toggleChecked();
                            //   controller.updateTotalPrice(
                            //     price: widget.food.price,
                            //   );
                            // },
                            onChanged:
                                (_) => controller.toggleAdditive(additive),
                          ),
                          index != controller.additivesList.length - 1
                              ? Divider(
                                height: 2.h,
                                thickness: 0.7,
                                color: kPrimary,
                                indent: 5,
                                endIndent: 5,
                              )
                              : SizedBox(),
                        ],
                      );
                    });
                  }),
                ),

                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Quantity',
                      style: appStyle(16, kDark, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: controller.incrementQuantity,
                          child: Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Icons.add, size: 20.sp, color: kWhite),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Obx(
                            () => ReusableText(
                              text: "${controller.quantity.value}",
                              style: appStyle(15, kDark, FontWeight.w600),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.decrementQuantity,
                          child: Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20.sp,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                            left: 16.w,
                            right: 16.w,
                            top: 16.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                text: 'Special Request',
                                style: appStyle(14, kDark, FontWeight.w500),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                controller: requestController,
                                hintText: "Add a note",
                                maxLines: 4,
                              ),
                              SizedBox(height: 12.h),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // requestController.clear();
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Done',
                                    style: appStyle(
                                      12,
                                      kWhite,
                                      FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.messenger_outline_outlined, size: 18.sp),
                      SizedBox(width: 12.w),
                      ReusableText(
                        text: 'Any special requests?',
                        style: appStyle(14, kDark, FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                Center(
                  child: Container(
                    height: 60.h,
                    width: width * 0.6.w,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showVerificationSheet(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: ReusableText(
                              text: 'Place Order',
                              style: appStyle(16, kLightWhite, FontWeight.w600),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: kSecondary,
                            radius: 30.r,
                            child: Icon(Ionicons.cart, color: kLightWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Container(
          height: 525.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chatgptback1.png'),
              // image: NetworkImage(widget.food.imageUrl),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                ReusableText(
                  text: 'Verify your phone number',
                  style: appStyle(18, kPrimary, FontWeight.w700),
                ),

                SizedBox(
                  height: 350.h,
                  child: Column(
                    children: List.generate(verificationReasons.length, (
                      index,
                    ) {
                      return ListTile(
                        leading: Icon(
                          Icons.check_circle_outline,
                          color: kPrimary,
                        ),
                        title: Text(
                          verificationReasons[index],
                          textAlign: TextAlign.justify,
                          style: appStyle(11, kDark, FontWeight.w500),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  buttonWidth: width * 0.4.w,
                  buttonHeight: 50.h,
                  borderRadius: 30.r,
                  buttonText: 'Verify Phone Number',
                  buttonColor: kPrimary,
                  onTap: () {
                    Get.to(PhoneVerificationPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

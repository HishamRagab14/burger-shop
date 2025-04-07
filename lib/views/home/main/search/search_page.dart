import 'package:burger_shop_app/common/custom_container.dart';
import 'package:burger_shop_app/common/custom_text_field.dart';
import 'package:burger_shop_app/common/shimmers/food_list_shimmer.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/search_controller.dart';
import 'package:burger_shop_app/views/home/main/search/loading_widget.dart';
import 'package:burger_shop_app/views/home/main/search/search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FoodSearchController controller = Get.put(FoodSearchController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextField(
              onChanged: (value) {
                controller.query.value = value;
              },
              controller: _searchController,
              keyboardType: TextInputType.text,
              hintText: 'Search for foods',
              suffixIcon: GestureDetector(
                onTap: () {
                  if (controller.isTriggered == false) {
                    controller.searchFoods(_searchController.text);
                    controller.setTrigger = true;
                  } else {
                    controller.searchResults.clear();
                    controller.setTrigger = false;
                    _searchController.clear();
                  }
                },
                child:
                    controller.isTriggered == false
                        ? Icon(
                          Ionicons.search_circle,
                          size: 35,
                          color: kPrimary,
                        )
                        : Icon(
                          Ionicons.close_circle,
                          size: 35,
                          color: kPrimary,
                        ),
              ),
            ),
          ),
        ),
        body: CustomContainer(
          color: Colors.white,
          containerContent:
              controller.isLoading
                  ? const FoodListShimmer()
                  : controller.searchResults.isEmpty
                  ? const LoadingWidget()
                  : const SearchResults(),
        ),
      ),
    );
  }
}

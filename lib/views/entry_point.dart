import 'package:burger_shop_app/constants/constants.dart';
import 'package:burger_shop_app/controllers/tab_index_controller.dart';
import 'package:burger_shop_app/views/home/main/cart/cart_page.dart';
import 'package:burger_shop_app/views/home/main/home/home_page.dart';
import 'package:burger_shop_app/views/home/main/profile/profile_page.dart';
import 'package:burger_shop_app/views/home/main/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  final List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: kPrimary),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    unselectedIconTheme: IconThemeData(color: Colors.black38),
                    selectedIconTheme: IconThemeData(color: kSecondary),
                    onTap: (value) {
                      controller.setTabIndex = value;
                    },
                    currentIndex: controller.tabIndex,
                    items: [
                      BottomNavigationBarItem(
                        icon:
                            controller.tabIndex == 0
                                ? Icon(AntDesign.home)
                                : Icon(AntDesign.appstore_o),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon:
                            controller.tabIndex == 1
                                ? Icon(AntDesign.search1)
                                : Icon(AntDesign.search1),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Badge(
                          label: Text('1'),
                          child: Icon(FontAwesome.opencart),
                        ),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.tabIndex == 3 ? Icon(FontAwesome.user_circle) : Icon(FontAwesome.user_circle_o),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:burger_shop_app/firebase_options.dart';
import 'package:burger_shop_app/views/entry_point.dart';
// import 'package:burger_shop_app/views/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget defaultHome = MainScreen();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  // try {
  //   // Force create SharedPreferences if doesn't exist
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('auth_token') == null) {
  //     await prefs.setString('auth_token', '');
  //   }
  // } catch (e) {
  //   debugPrint('SharedPreferences workaround applied');
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: defaultHome,
        );
      },
    );
  }
}

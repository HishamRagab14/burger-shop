// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class CategoryController extends GetxController {
//   final RxString _category = ''.obs;
//   String get categoryValue => _category.value;
//   set updateCategory(String value) {
//     _category.value = value;
//     update();
//   }

//   final RxString _title = ''.obs;
//   String get titleValue => _title.value;
//   set updateTitle(String value) {
//     debugPrint('🔄 Updating category from $titleValue to $value');
//     _title.value = value;
//     update();
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxString _category = ''.obs;
  String get categoryValue => _category.value;
  set updateCategory(String value) {
    _category.value = value;
    update();
  }

  final RxString _title = ''.obs;
  String get titleValue => _title.value;
  set updateTitle(String value) {
    debugPrint('🔄 Updating category from $titleValue to $value');
    _title.value = value;
    update();
  }
}

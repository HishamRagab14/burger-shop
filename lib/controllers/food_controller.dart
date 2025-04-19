// import 'package:burger_shop_app/models/hook_models/additive_obs.dart';
// import 'package:get/get.dart';

// class FoodController extends GetxController {
//   RxInt currentPage = 0.obs;

//   bool initialCheckValue = false;

//   late double baseFoodPrice;

//   var additivesList = <AdditiveObs>[].obs;

//   void changePage(int index) {
//     currentPage.value = index;
//   }

//   RxInt quantity = 1.obs;

//   RxDouble totalPrice = 0.0.obs;

//   void incrementQuantity() {
//     quantity.value += 1;
//     updateTotalPrice(price: baseFoodPrice);
//   }

//   void decrementQuantity() {
//     if (quantity.value > 1) {
//       quantity.value -= 1;
//     }
//     updateTotalPrice(price: baseFoodPrice);
//   }

//   void initializeFoodPrice(double foodPrice) {
//     baseFoodPrice = foodPrice;
//     updateTotalPrice(price: baseFoodPrice);
//   }

//   void loadAdditives(List<Map<String, dynamic>> additiveMaps) {
//     // additivesList.clear();

//     additivesList.value =
//         additiveMaps.map((additiveMap) {
//           return AdditiveObs(
//             id: additiveMap['id'] ?? 0, // Assuming 'id' is part of the map
//             title: additiveMap['title'] ?? '',
//             price: (additiveMap['price'] ?? 0).toString(),
//             checked: false, // Default to unchecked
//           );
//         }).toList();
//   }

//   void toggleAdditive(AdditiveObs additive) {
//     additive.toggleChecked();
//     updateTotalPrice(price: baseFoodPrice);
//   }

//   // Update totalPrice using food price passed as parameter
//   void updateTotalPrice({required double price}) {
//     double additiveTotal = additivesList
//         .where((additive) => additive.isChecked.value)
//         .map((additive) => double.tryParse(additive.price) ?? 0)
//         .fold(0.0, (previousValue, element) => previousValue + element);

//     totalPrice.value = (price * quantity.value) + additiveTotal;
//   }
// }


import 'package:burger_shop_app/models/hook_models/additive_obs.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  /// سعر الأكلة الواحدة (بدون إضافات)
  late double baseFoodPrice;

  /// عدد الكمية
  RxInt quantity = 1.obs;

  /// إجمالي السعر النهائي (quantity * basePrice + إضافات)
  RxDouble totalPrice = 0.0.obs;

  /// قائمة الإضافات
  var additivesList = <AdditiveObs>[].obs;

  /// تناديها أول ما تجي الصفحة
  void initialize(double foodPrice, List<AdditiveObs> additives) {
    baseFoodPrice = foodPrice;
    additivesList.assignAll(additives);                  // حَمِّل الإضافات
    _recalculateTotal();                                 // احسب السعر أول مرة
  }

  /// زيادة
  void incrementQuantity() {
    quantity.value++;
    _recalculateTotal();
  }

  /// تقليل
  void decrementQuantity() {
    if (quantity.value > 1) quantity.value--;
    _recalculateTotal();
  }

  /// تبديل حالة إضافة معينة
  void toggleAdditive(AdditiveObs a) {
    a.toggleChecked();
    _recalculateTotal();
  }

  /// كل مرة تحسب السعر النهائي من هنا
  void _recalculateTotal() {
    final addTotal = additivesList
        .where((a) => a.isChecked.value)
        .map((a) => double.tryParse(a.price) ?? 0)
        .fold<double>(0, (sum, e) => sum + e);

    totalPrice.value = baseFoodPrice * quantity.value + addTotal;
  }
}

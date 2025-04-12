import 'package:burger_shop_app/models/hook_models/additive_obs.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;

  bool initialCheckValue = false;

  var additivesList = <AdditiveObs>[].obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  RxInt quantity = 1.obs;

  RxDouble totalPrice = 0.0.obs;

  void incrementQuantity({required double price}) {
    quantity.value += 1;
    updateTotalPrice(price: price);
  }
  

  void decrementQuantity({required double price}) {
    if (quantity.value > 1) {
      quantity.value -= 1;
    }
    updateTotalPrice(price: price);
  }

  void loadAdditives(List<Map<String, dynamic>> additiveMaps) {
    // additivesList.clear();

    additivesList.value =
        additiveMaps.map((additiveMap) {
          return AdditiveObs(
            id: additiveMap['id'] ?? 0, // Assuming 'id' is part of the map
            title: additiveMap['title'] ?? '',
            price: (additiveMap['price'] ?? 0).toString(),
            checked: false, // Default to unchecked
          );
        }).toList();
  }

  // Update totalPrice using food price passed as parameter
  void updateTotalPrice({required double price}) {
    double additiveTotal = additivesList
        .where((additive) => additive.isChecked.value)
        .map((additive) => double.tryParse(additive.price) ?? 0)
        .fold(0.0, (previousValue, element) => previousValue + element);

    totalPrice.value = (price * quantity.value) + additiveTotal;
  }
}

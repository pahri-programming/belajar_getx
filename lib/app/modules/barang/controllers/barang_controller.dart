import 'package:get/get.dart';

class BarangController extends GetxController {
  var itemName = ''.obs;
  var quantity = 0.obs;
  var pricePerUnit = 0.0.obs;
  var category = ''.obs;

  var total = 0.0.obs;
  var totalAfterDiscount = 0.0.obs;

  List<String> categories = ["Makanan", "Minuman", "Alat Tulis"];

  void calculator() {
    total.value = quantity.value * pricePerUnit.value;
    if (total.value >= 100000) {
      totalAfterDiscount.value = total.value * 0.9;
    } else {
      totalAfterDiscount.value = total.value;
    }
  }

  void clearForm() {
    itemName.value = '';
    quantity.value = 0;
    pricePerUnit.value = 0.0;
    category.value = '';
    total.value = 0.0;
    totalAfterDiscount.value = 0.0;
  }
}

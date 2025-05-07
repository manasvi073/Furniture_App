import 'package:get/get.dart';

class CartController extends GetxController {
  // Sample cart size
  final int cartSize = 3;

  // Reactive list of checkboxes
  RxList<bool> isCheckedList = <bool>[].obs;
  RxList<int> quantityList = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    isCheckedList.value = List.generate(cartSize, (_) => true);
    quantityList.value = List.generate(cartSize, (_) => 1);
  }

  void incrementQty(int index) {
    quantityList[index]++;
  }

  void decrementQty(int index) {
    if (quantityList[index] > 1) {
      quantityList[index]--;
    }
  }

  void toggleCheck(int index, bool value) {
    isCheckedList[index] = value;
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/controller/best_sellers.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  var isSelected = 0.obs;
  var selected = 0.obs;
  var categoryList = <CategoryModel>[].obs;
  var sellersList = <BestSellersModel>[].obs;
  var url;
  var productCounts = <String, RxInt>{}.obs;

  late final WebViewController controller;

  void onTab(int index) {
    isSelected.value = index;
  }

  void selectIcon(int index) {
    selected.value = index;
  }

  void increment(String productId) {
    if (!productCounts.containsKey(productId)) {
      productCounts[productId] = 1.obs;
    } else {
      productCounts[productId]!.value++;
    }
  }

  void decrement(String productId) {
    if (productCounts.containsKey(productId) &&
        productCounts[productId]!.value > 1) {
      productCounts[productId]!.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadCategory();
    loadSellers();

    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url));
    }
  }

  Future<void> loadCategory() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/categories.json');
      log('loaded category data -> $response');
      final List<dynamic> data = json.decode(response);

      categoryList.value =
          data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      log('Error -> $e');
    }
  }

  Future<void> loadSellers() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/best_sellers.json');
      log('loaded Sellers data -> $response');
      final List<dynamic> data = json.decode(response);

      sellersList.value =
          data.map((json) => BestSellersModel.fromJson(json)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      log('Error -> $e');
    }
  }
}

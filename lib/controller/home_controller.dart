import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  var isSelected = 0.obs;
  var selected = 0.obs;
  var categoryList = <CategoryModel>[].obs;
  var count = 0.obs;
  var url;

  late final WebViewController controller;

  void onTab(int index) {
    isSelected.value = index;
  }

  void selectIcon(int index) {
    selected.value = index;
  }

  void increment() {
    count++;
    log('increment value -> $count');
  }

  void decrement() {
    if (count > 1) {
      count--;
      log('decrement value -> $count');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadCategory();

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
}

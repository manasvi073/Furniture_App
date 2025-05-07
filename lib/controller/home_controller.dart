import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/controller/best_sellers.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  var isSelected = 0.obs;
  var selected = 0.obs;
  var categoryList = <CategoryModel>[].obs;
  var sellersList = <BestSellersModel>[].obs;
  var url;
  var productCounts = <String, RxInt>{}.obs;
  var sellerCounts = <String, RxInt>{}.obs;
  final box = GetStorage();
  var favoriteCharacters = <String>[].obs;

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

  void sellerIncrement(String id) {
    if (!sellerCounts.containsKey(id)) {
      sellerCounts[id] = 1.obs;
    } else {
      sellerCounts[id]!.value++;
    }
  }

  void sellerDecrement(String id) {
    if (sellerCounts.containsKey(id) && sellerCounts[id]!.value > 1) {
      sellerCounts[id]!.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadCategory();
    loadSellers();
    loadFavorites();

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

  void loadFavorites() {
    List<dynamic>? storedFavorites = box.read<List<dynamic>>('favorites');
    if (storedFavorites != null) {
      favoriteCharacters.value = storedFavorites.map((e) {
        if (e is Map<String, dynamic>) {
          return e['id'] as String;
        } else if (e is String) {
          return e;
        }
        return '';
      }).toList();
    } else {
      favoriteCharacters.value = [];
    }
  }

  void toggleFavorite(CategoryModel category) {
    Map<String, dynamic> favoriteItem = {
      "id": category.id,
      "name": category.name,
      "image": category.image,
    };

    List<Map<String, dynamic>> favorites =
        (box.read<List<dynamic>>('favorites') ?? [])
            .map((e) => Map<String, dynamic>.from(e))
            .toList();

    int index = favorites.indexWhere((item) => item['id'] == category.id);

    if (index != -1) {
      favorites.removeAt(index);
      favoriteCharacters.remove(category.id);
    } else {
      favorites.add(favoriteItem);
      favoriteCharacters.add(category.id!);
    }

    box.write('favorites', favorites);
    log('Favorites Data -> $favorites');
  }
}

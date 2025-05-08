import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/constant/image_const.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:furniture_app/screens/cart_screen.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductDetail extends StatelessWidget {
  final CategoryModel? productData;

  const ProductDetail({super.key, this.productData});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final String? productId = productData!.id;

    return Scaffold(
      backgroundColor: ColorConst.appLightWhite,
      body: Obx(() {
        final count = homeController.productCounts[productId] ?? 1.obs;

        return SafeArea(
          child: productData!.id!.isEmpty
              ? LoadingAnimationWidget.hexagonDots(
                  color: ColorConst.appGray, size: 24)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 350,
                            decoration: const BoxDecoration(
                              color: ColorConst.appBackColor,
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            right: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.offAll(() => const HomeScreen());
                                  },
                                  // onTap: () => Get.back(),
                                  child: const CircleAvatar(
                                    backgroundColor: ColorConst.appWhite,
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: ColorConst.appGreen,
                                    ),
                                  ),
                                ),
                                Obx(() {
                                  final isFavorite = homeController
                                      .favoriteCharacters
                                      .contains(productData!.id);
                                  return GestureDetector(
                                    onTap: () {
                                      homeController
                                          .toggleFavorite(productData!.id!);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: ColorConst.appWhite,
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite_rounded
                                            : Icons.favorite_border_rounded,
                                        color: isFavorite
                                            ? ColorConst.appRed
                                            : ColorConst.appGreen,
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 60,
                            child: Image.asset(
                              ImageConst.appOvel,
                              height: 102,
                              width: 291,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            bottom: 90,
                            child: Image.asset(
                              productData!.image ?? '',
                              height: 180,
                              width: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  productData!.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: ColorConst.appGreen,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: ColorConst.appLightYellow,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: ColorConst.appYellow,
                                        size: 13,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        productData!.rating ?? '',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: ColorConst.appYellow,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              productData!.categoryType ?? '',
                              style: const TextStyle(
                                  color: ColorConst.appGray, fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              productData!.description ?? '',
                              style: const TextStyle(
                                color: ColorConst.appGray,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                for (int i = 0;
                                    i < (productData!.subImages?.length ?? 0);
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      productData!.subImages![i],
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  'Color',
                                  style: TextStyle(
                                    color: ColorConst.appGreen,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _colorDot(ColorConst.appGray),
                                const SizedBox(width: 8),
                                _colorDot(ColorConst.appLightGray),
                                const SizedBox(width: 8),
                                _colorDot(ColorConst.appRed),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorConst.appBackColor,
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => homeController
                                            .decrement(productId!),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: ColorConst.appWhite,
                                          ),
                                          child: const Icon(Icons.remove,
                                              size: 18,
                                              color: ColorConst.appGreen),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${count.value}',
                                        style: const TextStyle(
                                          color: ColorConst.appGreen,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () => homeController
                                            .increment(productId!),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: ColorConst.appWhite,
                                          ),
                                          child: const Icon(Icons.add,
                                              size: 18,
                                              color: ColorConst.appGreen),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConst.appGreen,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {
                                  homeController.addToCart(productData!);
                                  Get.to(() => const CartScreen());
                                  // Get.off(() => const CartScreen());
                                },
                                child: Text(
                                  "Add to cart | ₹${(count.value == 0 ? int.parse(productData!.price!.replaceAll(RegExp(r'[^0-9]'), '')) : int.parse(productData!.price!.replaceAll(RegExp(r'[^0-9]'), '')) * count.value)}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: ColorConst.appWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }

  static Widget _colorDot(Color color) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: ColorConst.appGray, width: 1.5),
      ),
    );
  }
}

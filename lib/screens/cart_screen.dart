import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: ColorConst.appBackColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const CircleAvatar(
                      backgroundColor: ColorConst.appWhite,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: ColorConst.appGreen,
                      ),
                    ),
                  ),
                  const Text(
                    'Cart',
                    style: TextStyle(
                      color: ColorConst.appGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homeController.cartItems.clear();
                    },
                    child: const CircleAvatar(
                      backgroundColor: ColorConst.appWhite,
                      child: Icon(Icons.delete_outline_outlined,
                          color: ColorConst.appGreen),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Cart Items List
            Expanded(
              child: Obx(() {
                if (homeController.cartItems.isEmpty) {
                  return const Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(
                        color: ColorConst.appGray,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: homeController.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = homeController.cartItems[index];
                    return _cartProduct(product);
                  },
                );
              }),
            ),
            // Checkout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConst.appGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Proceed to checkout logic
                  },
                  child: const Text(
                    "Proceed to checkout",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorConst.appWhite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cartProduct(product) {
    final HomeController homeController = Get.find<HomeController>();
    final String? productId = product.id;
    final count = homeController.productCounts[productId] ?? 1.obs;

    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorConst.appWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorConst.appBackColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                product.image!,
                height: 52,
                width: 62,
                // fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: const TextStyle(
                        color: ColorConst.appBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      product.categoryType ?? '',
                      style: const TextStyle(
                        color: ColorConst.appGray,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // "${product.price}",
                          " ₹${(count.value == 0 ? int.parse(product.price!.replaceAll(RegExp(r'[^0-9]'), '')) : int.parse(product.price!.replaceAll(RegExp(r'[^0-9]'), '')) * count.value)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorConst.appBlack,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConst.appBackColor,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    homeController.decrement(productId!),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConst.appWhite,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(Icons.remove,
                                      size: 18, color: ColorConst.appGreen),
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
                                onTap: () =>
                                    homeController.increment(productId!),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConst.appWhite,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(Icons.add,
                                      size: 18, color: ColorConst.appGreen),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

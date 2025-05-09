import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:get/get.dart';

class CheckoutOrderScreen extends StatelessWidget {
  const CheckoutOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
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
                  const SizedBox(width: 100),
                  const Text(
                    'Checkout Orders',
                    style: TextStyle(
                      color: ColorConst.appGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: checkoutData()),
          ],
        ),
      ),
    );
  }

  Widget checkoutData() {
    final HomeController homeController = Get.find<HomeController>();

    final int totalAmount = homeController.cartItems.fold<int>(
      0,
      (sum, product) {
        final count = homeController.productCounts[product.id] ?? 1.obs;
        final price =
            int.parse(product.price!.replaceAll(RegExp(r'[^0-9]'), ''));
        return sum + (price * count.value);
      },
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        child: Column(
          children: [
            if (homeController.cartItems.isEmpty)
              const Text(
                'No added checkout Order',
                style: TextStyle(
                  color: ColorConst.appGreen,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConst.appWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.cartItems.length,
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: ColorConst.appGreen.withOpacity(0.2),
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      final product = homeController.cartItems[index];
                      final String? productId = product.id;
                      final count =
                          homeController.productCounts[productId] ?? 1.obs;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 13),
                        child: Row(
                          children: [
                            Image.asset(
                              // ImageConst.appBrownChair,
                              product.image!,
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // 'Brown Chair',
                                  product.name!,
                                  style: const TextStyle(
                                      color: ColorConst.appGreen,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  // product.price!,
                                  "₹${(count.value == 0 ? int.parse(product.price!.replaceAll(RegExp(r'[^0-9]'), '')) : int.parse(product.price!.replaceAll(RegExp(r'[^0-9]'), '')) * count.value)}",
                                  style: const TextStyle(
                                      color: ColorConst.appGreen,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: ColorConst.appGreen)),
                              child: Center(
                                child: Text(
                                  '${count.value}x',
                                  style: const TextStyle(
                                      color: ColorConst.appGreen,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: ColorConst.appWhite,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Checkout Amount:',
                                    style: TextStyle(
                                      color: ColorConst.appGreen,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '₹$totalAmount',
                                    style: const TextStyle(
                                      color: ColorConst.appGreen,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

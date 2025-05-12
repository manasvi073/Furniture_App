import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/constant/image_const.dart';
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    checkoutData(),
                    const SizedBox(height: 10),
                    totalPriceData(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 119,
                                    width: 119,
                                    child: CircleAvatar(
                                      backgroundColor: ColorConst.appGreen,
                                      child: Image.asset(
                                        ImageConst.appOrderIcon,
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Order Successful!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConst.appBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Your order was placed successfully and is being processed!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          ColorConst.appBlack.withOpacity(0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 47,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: ColorConst.appGreen,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'OK',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConst.appWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: const Text(
                            "Place Order",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConst.appWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkoutData() {
    final HomeController homeController = Get.find<HomeController>();

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
                                  product.name!,
                                  style: const TextStyle(
                                      color: ColorConst.appGreen,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
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

  Widget totalPriceData() {
    final HomeController homeController = Get.find<HomeController>();

    int deliveryChargePerItem = 2;

    final int totalAmount = homeController.cartItems.fold<int>(
      0,
      (sum, product) {
        final count = homeController.productCounts[product.id] ?? 1.obs;
        final price =
            int.parse(product.price!.replaceAll(RegExp(r'[^0-9]'), ''));
        return sum + (price * count.value);
      },
    );

    final int totalDeliveryCharge = homeController.cartItems.fold<int>(
      0,
      (sum, product) {
        final count = homeController.productCounts[product.id] ?? 1.obs;
        return sum + (deliveryChargePerItem * count.value);
      },
    );

    final int finalAmount = totalAmount - totalDeliveryCharge;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ColorConst.appWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'SubTotal',
                        style: TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '₹$totalAmount',
                        style: const TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Delivery Charge',
                        style: TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '- ₹$totalDeliveryCharge',
                        style: const TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: ColorConst.appGreen.withOpacity(0.1)),
                  Row(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '₹$finalAmount',
                        style: const TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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

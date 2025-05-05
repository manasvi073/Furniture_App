import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/constant/image_const.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> isCheckedList = List.generate(3, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.appBackColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.offAll(ProductDetail());
                    },
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
                  const CircleAvatar(
                    backgroundColor: ColorConst.appWhite,
                    child: Icon(Icons.delete_outline_outlined,
                        color: ColorConst.appGreen),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: isCheckedList.length,
                itemBuilder: (context, index) {
                  return _cartProduct(index);
                },
              ),
            ),
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
                    // Get.off(() => const CartScreen());
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

  Widget _cartProduct(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorConst.appWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: isCheckedList[index],
                onChanged: (val) {
                  setState(() {
                    isCheckedList[index] = val!;
                  });
                },
                activeColor: ColorConst.appGreen,
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: ColorConst.appBackColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  ImageConst.appYellowChair,
                  height: 65,
                  width: 78,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Yellow Chair',
                    style: TextStyle(
                      color: ColorConst.appBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'Armchair',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '₹ 10,500',
                        style: TextStyle(
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
                              onTap: () {},
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
                            const Text(
                              "1",
                              style: TextStyle(
                                color: ColorConst.appGreen,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {},
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

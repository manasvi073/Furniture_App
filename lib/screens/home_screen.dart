import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/constant/image_const.dart';

import 'package:furniture_app/controller/home_controller.dart';
import 'package:furniture_app/model/best_sellers_model.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:furniture_app/screens/favorite_screen.dart';
import 'package:furniture_app/screens/cart_screen.dart';
import 'package:furniture_app/screens/product_detail.dart';
import 'package:furniture_app/screens/profile_screen.dart';
import 'package:furniture_app/widgets/app_bottom_navigation_widget.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    final List<Widget> screens = [
      _homeContent(homeController),
      const FavoriteScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => screens[homeController.selected.value]),
      bottomNavigationBar: const AppBottomNavigationWidget(),
    );
  }

  static Widget _homeContent(HomeController homeController) {
    return SingleChildScrollView(
      child: Center(
        child:
            /* homeController.categoryList.isEmpty
              ? LoadingAnimationWidget.hexagonDots(
                  color: ColorConst.appGray,
                  size: 24,
                )
              : */

            Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageConst.appLogo,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Discover The Best \nFurniture.',
                    style: TextStyle(
                      color: ColorConst.appGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search for furniture',
                    hintStyle:
                        const TextStyle(color: Colors.black38, fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: ColorConst.appLightGray)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: ColorConst.appLightGray)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        ImageConst.appSearch,
                        height: 17,
                        width: 17,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        ImageConst.appListIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'Categories',
                style: TextStyle(
                  color: ColorConst.appGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              scrollText(['Chairs', 'Cupboard', 'Tables', 'Lamps', 'Sofa']),
              const SizedBox(height: 20),
              Obx(
                () => SizedBox(
                  height: 275,
                  child: homeController.categoryList.isEmpty
                      ? LoadingAnimationWidget.hexagonDots(
                          color: ColorConst.appGray,
                          size: 24,
                        )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.categoryList.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.off(() => ProductDetail(
                                  productData:
                                      homeController.categoryList[index],
                                )),
                            child: _categoryCard(
                                homeController.categoryList[index]),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'Best Seller',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: ColorConst.appGreen,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => SizedBox(
                  height: 114,
                  child: homeController.sellersList.isEmpty
                      ? LoadingAnimationWidget.hexagonDots(
                          color: ColorConst.appGray,
                          size: 24,
                        )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.sellersList.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          itemBuilder: (context, index) =>
                              _seller(homeController.sellersList[index]),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget scrollText(List<String> text) {
    final HomeController homeController = Get.find<HomeController>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            for (int i = 0; i < text.length; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: homeController.isSelected.value == i
                        ? ColorConst.appGreen
                        : ColorConst.appLightWhite),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 5, right: 21, left: 21),
                  child: Text(
                    text[i],
                    style: TextStyle(
                      color: homeController.isSelected.value == i
                          ? ColorConst.appLightWhite
                          : ColorConst.appGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget _categoryCard(CategoryModel data) {
    final HomeController homeController = Get.find<HomeController>();
    final String? productId = data.id;

    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: ColorConst.appWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                height: 170,
                decoration: BoxDecoration(
                  color: ColorConst.appBackColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(data.image!),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorConst.appRed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: ColorConst.appWhite,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorConst.appLightYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star,
                          color: ColorConst.appYellow, size: 13),
                      const SizedBox(width: 2),
                      Text(
                        data.rating!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: ColorConst.appYellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name!,
                  style: const TextStyle(
                    color: ColorConst.appBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  data.categoryType!,
                  style: const TextStyle(
                    color: ColorConst.appGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            final count = homeController.productCounts[productId] ?? 0.obs;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    data.price!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorConst.appBlack,
                    ),
                  ),
                  const Spacer(),
                  if (count.value > 0) ...[
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorConst.appWhite,
                        border: Border.all(color: ColorConst.appLightGray),
                      ),
                      child: IconButton(
                        onPressed: () => homeController.decrement(productId!),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.remove,
                          color: ColorConst.appGray,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '${count.value}',
                      style: const TextStyle(
                        color: ColorConst.appBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'poppins',
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConst.appGreen,
                    ),
                    child: IconButton(
                      onPressed: () => homeController.increment(productId!),
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.add,
                        color: ColorConst.appWhite,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  static Widget _seller(BestSellersModel sellerData) {
    final HomeController homeController =
        Get.put(HomeController(), permanent: true);
    final String id = sellerData.id!;
    final count = homeController.sellerCounts.putIfAbsent(id, () => 0.obs);

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: ColorConst.appWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                // height: 170,
                decoration: BoxDecoration(
                  color: ColorConst.appBackColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    sellerData.image!,
                    height: 55,
                    width: 68,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorConst.appLightYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star,
                          color: ColorConst.appYellow, size: 13),
                      const SizedBox(width: 2),
                      Text(
                        sellerData.rating!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: ColorConst.appYellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerData.name!,
                  style: const TextStyle(
                    color: ColorConst.appBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  sellerData.categoryType!,
                  style: const TextStyle(
                    color: ColorConst.appGray,
                    fontSize: 12,
                  ),
                ),
                Obx(() {
                  return Row(
                    children: [
                      Text(
                        sellerData.price!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.appBlack,
                        ),
                      ),
                      const SizedBox(width: 25),
                      if (count.value > 0) ...[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConst.appWhite,
                            border: Border.all(color: ColorConst.appLightGray),
                          ),
                          child: IconButton(
                            onPressed: () => homeController.sellerDecrement(id),
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.remove,
                              color: ColorConst.appGray,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          '${count.value}',
                          style: const TextStyle(
                            color: ColorConst.appBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'poppins',
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorConst.appGreen,
                        ),
                        child: IconButton(
                          onPressed: () => homeController.sellerIncrement(id),
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.add,
                            color: ColorConst.appWhite,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

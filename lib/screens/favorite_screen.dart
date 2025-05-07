import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: Column(
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
                const SizedBox(width: 160),
                const Text(
                  'Favorite',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(() {
                    List<CategoryModel> favoriteList = homeController
                        .categoryList
                        .where((item) =>
                            homeController.favoriteCharacters.contains(item.id))
                        .toList();

                    if (favoriteList.isEmpty) {
                      return const Center(
                        child: Text(
                          "No favorites added",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConst.appGreen,
                          ),
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: favoriteList.length,
                      itemBuilder: (context, index) {
                        final favoriteItem = favoriteList[index];
                        return _categoryCard(favoriteItem, homeController);
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
          // _categoryCard(),
        ],
      ),
    );
  }

  static Widget _categoryCard(
      CategoryModel data, HomeController homeController) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: ColorConst.appBackColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
            ),
            child: Row(
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
                const Spacer(),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorConst.appWhite,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: homeController.favoriteCharacters.contains(data.id)
                        ? ColorConst.appRed
                        : Colors.grey,
                    // color: ColorConst.appRed,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                data.image ?? '',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

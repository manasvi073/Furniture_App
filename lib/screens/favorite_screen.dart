import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/constant/image_const.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
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
          _categoryCard(),
        ],
      ),
    );
  }

  static Widget _categoryCard() {
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
                  'data.name!',
                  style: TextStyle(
                    color: ColorConst.appBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorConst.appWhite,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: ColorConst.appRed,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(ImageConst.appYellowChair),
          ),
        ],
      ),
    );
  }
}

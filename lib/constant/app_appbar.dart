import 'package:flutter/material.dart';
import 'package:furniture_app/constant/image_const.dart';

class AppAppbar extends StatelessWidget {
  const AppAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImageConst.appLogo,
          height: 70,
        ),
        const Spacer(),
        const Icon(Icons.favorite_border_rounded),
        const SizedBox(width: 10),
        const Icon(Icons.add_shopping_cart_rounded),
      ],
    );
  }
}

/*appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              ImageConst.appLogo,
              height: 70,
            ),
            const Spacer(),
            const Icon(Icons.favorite_border_rounded),
            const SizedBox(width: 10),
            const Icon(Icons.add_shopping_cart_rounded),
          ],
        ),
      ),
      */

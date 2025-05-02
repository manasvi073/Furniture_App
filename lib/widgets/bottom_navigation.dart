import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(Icons.favorite_border_rounded),
            Text(
              'Favorite',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorConst.appGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

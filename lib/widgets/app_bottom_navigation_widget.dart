import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AppBottomNavigationWidget extends StatelessWidget {
  const AppBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConst.appGreen,
        unselectedItemColor: ColorConst.appGreen,
        currentIndex: homeController.selected.value,
        onTap: homeController.selectIcon,
        items: [
          BottomNavigationBarItem(
            icon: Icon(homeController.selected.value == 0
                ? Icons.home
                : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              homeController.selected.value == 1
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(homeController.selected.value == 2
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(homeController.selected.value == 3
                ? Icons.person
                : Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



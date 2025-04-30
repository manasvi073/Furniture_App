import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/constant/image_const.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:furniture_app/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      color: ColorConst.appLightGreen,
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
                  color: ColorConst.appLightGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              scrollText(['Chairs', 'Cupboard', 'Tables', 'Lamps', 'Sofa']),
              const SizedBox(height: 10),
        
              /* SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: .75,
                  ),
                ),
              ),*/
        
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(right: 15),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorConst.appGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12),
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorConst.appBackColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(
                              ImageConst.appModernChair,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Modern Chair',
                            style: TextStyle(
                              color: ColorConst.appBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Armchair',
                            style: TextStyle(
                              color: ColorConst.appGray,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '₹ 12,500',
                                style: TextStyle(
                                  color: ColorConst.appBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConst.appLightGreen,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: ColorConst.appWhite,
                                  weight: 700,
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
        
                Container(
                width: 180,
                decoration: BoxDecoration(
                  color: ColorConst.appGray,
                  // color: ColorConst.appWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      height: 170,
                      decoration: BoxDecoration(
                        color: ColorConst.appBackColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          ImageConst.appModernChair,
                        ),
                      ),
                    ),
                    const Text(
                      'Modern Chair',
                      style: TextStyle(
                        color: ColorConst.appBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'Armchair',
                      style: TextStyle(
                        color: ColorConst.appGray,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ 12,500',
                          style: TextStyle(
                            color: ColorConst.appBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: ColorConst.appLightGreen,
                          child: Icon(
                            Icons.add,
                            color: ColorConst.appWhite,
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
      ),
    );
  }

  Widget scrollText(List<String> text) {
    final HomeController homeController = Get.put(HomeController());
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
                        ? ColorConst.appLightGreen
                        : ColorConst.appLightWhite),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 5, right: 21, left: 21),
                  child: Text(
                    text[i],
                    style: TextStyle(
                      color: homeController.isSelected.value == i
                          ? ColorConst.appLightWhite
                          : ColorConst.appLightGreen,
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
}

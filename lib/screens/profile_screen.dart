import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/constant/color_const.dart';
import 'package:furniture_app/controller/login_signup_controller.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:furniture_app/screens/privacy_policy_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      color: ColorConst.appWhite,
                      child: const Text(
                        'My Profile',
                        style: TextStyle(
                          color: ColorConst.appGreen,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'loginController.userName',
                    style: TextStyle(
                      color: ColorConst.appGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const Text(
                    'loginController.userEmail',
                    style: TextStyle(
                      color: ColorConst.appGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Text(
                'Account',
                style: TextStyle(
                  color: ColorConst.appGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              _profileContent(
                  'Setting',
                  const Icon(
                    Icons.delete_outline_outlined,
                    color: ColorConst.appGreen,
                  ),
                  ColorConst.appGreen),
              _profileContent(
                  'Notification',
                  const Icon(
                    Icons.notifications_active_outlined,
                    color: ColorConst.appBlue,
                  ),
                  ColorConst.appBlue),
              _profileContent(
                  'Older History ',
                  const Icon(
                    Icons.access_time,
                    color: ColorConst.appDarkYellow,
                  ),
                  ColorConst.appYellow),
              const Text(
                'Account',
                style: TextStyle(
                  color: ColorConst.appGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () => Get.off(() => const PrivacyPolicyScreen()),
                child: _profileContent(
                    'Privacy & Policy',
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: ColorConst.appBlue,
                    ),
                    ColorConst.appBlue),
              ),
              _profileContent(
                  'Terms & Conditions',
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: ColorConst.appYellow,
                  ),
                  ColorConst.appYellow),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 230,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            const Text(
                              'Log Out',
                              style: TextStyle(
                                color: ColorConst.appGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 17),
                            Divider(
                              color: ColorConst.appBlack.withOpacity(0.1),
                              indent: 30,
                              endIndent: 30,
                            ),
                            const SizedBox(height: 17),
                            const Text(
                              'Are you sure you want to log out?',
                              style: TextStyle(
                                color: ColorConst.appGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 25),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 165,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: ColorConst.appGreen
                                            .withOpacity(0.1),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: ColorConst.appGreen),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          loginController.logoutButton(),
                                      child: Container(
                                        height: 50,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: ColorConst.appGreen
                                              .withOpacity(0.1),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Yes, Logout',
                                            style: TextStyle(
                                              color: ColorConst.appGreen,
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
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: _profileContent(
                  'Log Out',
                  const Icon(
                    Icons.logout,
                    color: ColorConst.appRed,
                  ),
                  ColorConst.appRed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileContent(String text, Icon icon, Color backcolor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    color: backcolor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: icon,
              ),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(
                  color: ColorConst.appGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: ColorConst.appGreen,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

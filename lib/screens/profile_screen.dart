import 'package:flutter/material.dart';
import 'package:furniture_app/constant/color_const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Name',
                    style: TextStyle(
                      color: ColorConst.appGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const Text(
                    'Email',
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
              _profileContent(
                  'Privacy & Policy',
                  const Icon(
                    Icons.lock_outline_rounded,
                    color: ColorConst.appBlue,
                  ),
                  ColorConst.appBlue),
              _profileContent(
                  'Terms & Conditions',
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: ColorConst.appYellow,
                  ),
                  ColorConst.appYellow),
              _profileContent(
                'Log Out',
                const Icon(
                  Icons.logout,
                  color: ColorConst.appRed,
                ),
                ColorConst.appRed,
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

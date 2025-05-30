import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:furniture_app/firebase_options.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:furniture_app/screens/onboarding_screen.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialized successfully.');
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return GetMaterialApp(
      title: 'Furniture App',
      home: user == null ? const LoginScreen() : const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/firebase_options.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
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

/*
void main() {
  runApp(const MyApp());
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;

    return const GetMaterialApp(
      title: 'Furniture App',
      // home: HomeScreen(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

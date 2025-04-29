import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/model/login_model.dart';
import 'package:furniture_app/model/signup_model.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();

  var obscureText = true.obs;

  void show() {
    obscureText.value = !obscureText.value;
  }

  Future<void> SignInButton(String email, String password) async {
    if (formkey.currentState!.validate()) {
      try {
        final String response =
            await rootBundle.loadString('assets/json/login.json');
        log('SignIn Response: $response');
        final data = json.decode(response);

        List<Login> users = (data['login'] as List)
            .map((user) => Login.fromJson(user))
            .toList();

        final matchUser = users.firstWhereOrNull(
          (user) => user.email == email && user.password == password,
        );
        if (matchUser != null) {
          Fluttertoast.showToast(msg: 'Login Successful!');
          log('$matchUser');
          Get.off(() => const HomeScreen());
        } else {
          Fluttertoast.showToast(msg: 'Invalid Email or Password');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  Future<void> loadSignup(String name, String email, String password,
      String confirmPassword) async {
    if (formkey.currentState!.validate()) {
      try {
        final String response =
            await rootBundle.loadString('assets/json/signup.json');
        log('SignUp Response -> $response');
        final data = json.decode(response);

        List<Signup> users = (data['signup'] as List)
            .map((user) => Signup.fromJson(user))
            .toList();

        final matchUser = users.firstWhereOrNull(
          (user) =>
              user.name == name &&
              user.email == email &&
              user.password == password &&
              user.confirmPassword == confirmPassword,
        );
        if (matchUser != null) {
          Fluttertoast.showToast(msg: 'Signup Successfully');
          Get.off(() => const LoginScreen());
        } else {
          Fluttertoast.showToast(msg: 'Invalid Data');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}

/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/model/user_model.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  var obscureText = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void show() {
    obscureText.value = !obscureText.value;
  }

  void SignInButton(String email, String password) async {
    if (formkey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;

        if (user != null) {
          debugPrint('Signed in as :${user.email}');
        }

        Get.off(() => const HomeScreen());
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided.';
        } else {
          errorMessage = e.message ?? 'An unknown error occurred.';
        }
        Fluttertoast.showToast(msg: errorMessage);
        return;
      }
    }
  }

  void loadSignup(
      String name,
      String email,
      String password,
      ) async {
    if (formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await userCredential.user?.updateDisplayName(name);

        DateTime currentTime = DateTime.now();
        await addUserDetail(
          userCredential.user!.uid,
          name,
          email,
          currentTime,
        );

        Get.off(() => const LoginScreen());
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'The email is already in use.';
            break;
          case 'weak-password':
            errorMessage = 'The password provided is too weak.';
            break;
          default:
            errorMessage = e.message ?? 'An unknown error occurred.';
            break;
        }
        Fluttertoast.showToast(msg: errorMessage);
      } catch (e) {
        Fluttertoast.showToast(msg: 'An error occurred: $e');
      }
    }
  }

  addUserDetail(
      String userId,
      String username,
      String email,
      DateTime time,
      ) {
    UserModel user = UserModel(
      userid: userId,
      username: username,
      email: email,
      time: time,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(user.toMap());
  }
}
*/

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  var confirmPasswordObscureText = true.obs;
  File? selectedImage;


  final FirebaseAuth _auth = FirebaseAuth.instance;

  void show() {
    obscureText.value = !obscureText.value;
  }

  void confirmPasswordShow() {
    confirmPasswordObscureText.value = !confirmPasswordObscureText.value;
  }

  void SignInButton(String email, String password) async {
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
      log('Error -> $e');
      return;
    }
  }

  void loadSignup(
    String name,
    String email,
    String password,
  ) async {
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

  addUserDetail(
    String userId,
    String username,
    String email,
    DateTime time,
  ) {
    try {
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
    } catch (e) {
      debugPrint("Error saving user data: $e");
      Fluttertoast.showToast(msg: "Firestore error: $e");
    }
  }


  Future<String> uploadImage(File image) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      var storageRef =
      FirebaseStorage.instance.ref().child('profileimages/$imageName');
      var uploadTask = storageRef.putFile(image);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Image upload failed $e');
    }
  }


}

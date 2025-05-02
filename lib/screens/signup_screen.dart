import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controller/login_signup_controller.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:furniture_app/validation/app_validation.dart';
import 'package:furniture_app/widgets/app_button_widget.dart';
import 'package:furniture_app/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final TextEditingController confirmpasswordcontroller =
        TextEditingController();
    final LoginController loginController = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    final ImagePicker _picker = ImagePicker();

    String? confirmpasswordvalidation(String? value) {
      if (passwordcontroller.text.isEmpty) {
        return 'Enter your password';
      } else if (value == null || value.isEmpty) {
        return 'Please enter your confirm password';
      } else if (value != passwordcontroller.text) {
        return 'Confirm password does not match';
      }
      return null;
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/back3.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
/*
                  GestureDetector(
                    onTap: () async {
                      final pickedFile = await _picker.pickImage(
                          source: ImageSource.gallery);
                      if (pickedFile != null) {
                       loginController.selectedImage = File(pickedFile.path);

                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: loginController.selectedImage != null
                          ? FileImage(loginController.selectedImage!)
                          : const AssetImage('assets/icons/user.jpeg'),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60, top: 50),
                        child: loginController.selectedImage == null
                            ? const Icon(
                          Icons.camera_alt_sharp,
                          size: 29,
                        )
                            : null,
                      ),
                    ),
                  ),
*/

                  TextfieldWidget(
                    textEditingController: namecontroller,
                    hintText: 'Name..',
                    preFixIcon: const Icon(
                      Icons.account_box_outlined,
                      size: 20,
                      color: Colors.black38,
                    ),
                    validation: (value) =>
                        emptyValidation(value, 'Please enter your Name'),
                  ),
                  const SizedBox(height: 20),
                  TextfieldWidget(
                    textEditingController: emailcontroller,
                    hintText: 'Email address',
                    preFixIcon: const Icon(
                      Icons.mail_outline_rounded,
                      size: 20,
                      color: Colors.black38,
                    ),
                    validation: emailValidation,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => TextFormField(
                      controller: passwordcontroller,
                      obscureText:
                          loginController.confirmPasswordObscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffix: InkWell(
                          onTap: loginController.confirmPasswordShow,
                          child: Icon(
                            loginController.confirmPasswordObscureText.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black38, fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        focusColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.lock_outline_sharp,
                            size: 20,
                            color: Colors.black38,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      validator: passwordValidation,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => TextFormField(
                      controller: confirmpasswordcontroller,
                      obscureText: loginController.obscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffix: InkWell(
                          onTap: loginController.show,
                          child: Icon(
                            loginController.obscureText.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black38, fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        focusColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.lock_outline_sharp,
                            size: 20,
                            color: Colors.black38,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      validator: confirmpasswordvalidation,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                      text: 'Sign Up',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          loginController.loadSignup(
                            namecontroller.text,
                            emailcontroller.text,
                            passwordcontroller.text,
                          );
                        }
                      }),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: Colors.brown,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(
                                () => const LoginScreen(),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

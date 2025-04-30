import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controller/login_signup_controller.dart';
import 'package:furniture_app/screens/signup_screen.dart';
import 'package:furniture_app/validation/app_validation.dart';
import 'package:furniture_app/widgets/button_widget.dart';
import 'package:furniture_app/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final LoginController loginController = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();

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
                      obscureText: loginController.obscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
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
                      validator: passwordValidation,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, bottom: 20, top: 5),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.brown),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                      text: 'Login',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          loginController.SignInButton(
                              emailcontroller.text, passwordcontroller.text);
                        }
                      }),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                            color: Colors.brown,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const SignupScreen());
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

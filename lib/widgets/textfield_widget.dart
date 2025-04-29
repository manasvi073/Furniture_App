import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  final Icon preFixIcon;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validation;

  const TextfieldWidget({
    super.key,
    required this.hintText,
    required this.preFixIcon,
    required this.textEditingController,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        focusColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.black45)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: preFixIcon,
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
      validator: validation,
    );
  }
}

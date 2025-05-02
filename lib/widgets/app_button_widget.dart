import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: Colors.brown,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}

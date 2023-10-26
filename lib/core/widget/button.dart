import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2),
          padding: EdgeInsets.zero,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(text),
            ),
            const Positioned(
              right: 5,
              child: Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}

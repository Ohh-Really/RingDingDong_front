import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  CommonButton(this.text, {super.key, required this.onPressed});

  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )))),
    );
  }
}

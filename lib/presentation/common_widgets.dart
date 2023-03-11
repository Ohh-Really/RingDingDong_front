import 'package:flutter/material.dart';
import 'package:ringdingdong/app/config/app_colors.dart';

class CommonButton extends StatelessWidget {
  CommonButton(this.text, {super.key, required this.onPressed});

  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        onPressed: onPressed,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ))));
  }
}

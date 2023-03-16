import 'package:flutter/material.dart';
import 'package:ringdingdong/app/config/app_colors.dart';

class DetailHeaderContainer extends StatelessWidget {
  DetailHeaderContainer({super.key, required this.child, this.margin, this.padding});

  Widget child;
  EdgeInsets? margin;
  EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin ?? const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
      height: 50,
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}

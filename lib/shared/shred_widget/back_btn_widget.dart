import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';


class CustomBackBtn extends StatelessWidget {
  const CustomBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: AppColors.blackColor,
      iconSize: 20.0,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
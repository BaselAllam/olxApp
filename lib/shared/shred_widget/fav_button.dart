import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';



class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isSelected ? Icons.favorite : Icons.favorite_border),
      color: isSelected ? AppColors.orangeColor : AppColors.greyFourColor,
      iconSize: 20.0,
      onPressed: () {
        isSelected = !isSelected;
        setState(() {});
      },
    );
  }
}
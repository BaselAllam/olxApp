import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/logic/product_model.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';



class FavButton extends StatefulWidget {
  ProductModel productModel;
  FavButton({required this.productModel});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.productModel.isFav ? Icons.favorite : Icons.favorite_border),
      color: widget.productModel.isFav ? AppColors.orangeColor : AppColors.greyFourColor,
      iconSize: 20.0,
      onPressed: () {
        BlocProvider.of<ProductCubit>(context).handleFav(widget.productModel);
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/views/search_result_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';



class CategoryWidget extends StatefulWidget {
  final String categoryName;
  final String img;
  CategoryWidget({required this.categoryName, required this.img});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            height: 45.0,
            width: 125.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.whiteColor
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.img, height: 25, width: 30.0),
                Text('  ${widget.categoryName}', style: AppFonts.subGreyTextStyle)
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        BlocProvider.of<ProductCubit>(context).filterCategory(widget.categoryName);
        Navigator.push(context, MaterialPageRoute(builder: (_) => SearchResultScreen(screenTitle: widget.categoryName, isAllProducts: false)));
      },
    );
  }
}
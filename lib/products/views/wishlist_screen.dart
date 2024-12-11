import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/logic/product_state.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/notification_widget.dart';
import 'package:olx/shared/shred_widget/product_widget.dart';



class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('My Wishlist', style: AppFonts.primaryBlacTextStyle),
        actions: [NotificationWidget()],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 65.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WishlistCategoryFilterWidget(categoryName: 'Cars'),
                  WishlistCategoryFilterWidget(categoryName: 'Pets'),
                  WishlistCategoryFilterWidget(categoryName: 'Electronics'),
                  WishlistCategoryFilterWidget(categoryName: 'Apartments'),
                ],
              ),
            ),
            Flexible(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (BlocProvider.of<ProductCubit>(context).favProducts.isEmpty) {
                    return Center(child: Text('no Fav Products available', style: AppFonts.primaryBlacTextStyle));
                  } else {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.69
                      ),
                      children: [
                        for (int i = 0; i < BlocProvider.of<ProductCubit>(context).favProducts.length; i++)
                        ProductWidget(productModel: BlocProvider.of<ProductCubit>(context).favProducts[i])
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class WishlistCategoryFilterWidget extends StatefulWidget {
  final String categoryName;
  const WishlistCategoryFilterWidget({required this.categoryName});

  @override
  State<WishlistCategoryFilterWidget> createState() => _WishlistCategoryFilterWidgetState();
}

class _WishlistCategoryFilterWidgetState extends State<WishlistCategoryFilterWidget> {

  bool isSelected = false;

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
              color: isSelected ? AppColors.orangeColor : AppColors.whiteColor
            ),
            alignment: Alignment.center,
            child: Text('  ${widget.categoryName}', style: isSelected ? AppFonts.subWhiteyTextStyle : AppFonts.subGreyTextStyle)
          ),
        ],
      ),
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/logic/product_state.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';
import 'package:olx/shared/shred_widget/product_widget.dart';


class SearchResultScreen extends StatefulWidget {
  final String screenTitle;
  final bool isAllProducts;
  const SearchResultScreen({required this.screenTitle, this.isAllProducts = true});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text(widget.screenTitle, style: AppFonts.primaryBlacTextStyle),
        leading: CustomBackBtn()
      ),
      body: Container(
        child: widget.isAllProducts ? BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
             if (state is GetProductsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is  GetProductsErrorState) {
              return Center(child: Text('Some thing went wrong', style: AppFonts.primaryBlacTextStyle));
            } else if (BlocProvider.of<ProductCubit>(context).allProducts.isEmpty) {
              return Center(child: Text('There is no products now', style: AppFonts.primaryBlacTextStyle));
            } else {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62
                ),
                children: [
                  for (int i = 0; i < BlocProvider.of<ProductCubit>(context).allProducts.length; i++)
                  ProductWidget(productModel:BlocProvider.of<ProductCubit>(context).allProducts[i])
                ],
              );
            }
          },
        ) : BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
             if (state is FilterProductLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (BlocProvider.of<ProductCubit>(context).filteredProducts.isEmpty) {
              return Center(child: Text('There is no products for this category', style: AppFonts.primaryBlacTextStyle));
            } else {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62
                ),
                children: [
                  for (int i = 0; i < BlocProvider.of<ProductCubit>(context).filteredProducts.length; i++)
                  ProductWidget(productModel:BlocProvider.of<ProductCubit>(context).filteredProducts[i])
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
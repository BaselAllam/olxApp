import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';
import 'package:olx/shared/shred_widget/product_widget.dart';


class SearchResultScreen extends StatefulWidget {
  final String screenTitle;
  const SearchResultScreen({required this.screenTitle});

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
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.62
          ),
          children: [
            for (int i = 0; i < 15; i++)
            ProductWidget(productModel: {
                'productImg': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDIBxtZomfSTeVFkJqWN0itc6Q2FSomDWYnw&s',
                'productTitle': 'Apple Macboook Pro',
                'productPrice': '60000',
                'sellerAddress': 'Madienty, EG',
                'createdAt': '20-May'
              })
          ],
        ),
      ),
    );
  }
}
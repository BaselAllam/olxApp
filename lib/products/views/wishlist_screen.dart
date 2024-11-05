import 'package:flutter/material.dart';
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
            Align(alignment: Alignment.topLeft, child: Text('   Categories', style: AppFonts.primaryBlacTextStyle)),
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
            Container(
              height: MediaQuery.of(context).size.height - 260,
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
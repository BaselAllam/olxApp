import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/fav_button.dart';



class ProductWidget extends StatefulWidget {
  Map<String, dynamic> productModel;
  ProductWidget({required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 7.0),
              height: 150.0,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(widget.productModel['productImg']),
                  fit: BoxFit.fill
                ),
              ),
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text('New', style: AppFonts.subWhiteyTextStyle),
              ),
            ),
            Text('  ${widget.productModel['productTitle']}', style: AppFonts.subBlacTextStyle),
            Text('  ${widget.productModel['productPrice']} EGP', style: AppFonts.primaryBlacTextStyle),
            Text('  ${widget.productModel['sellerAddress']}', style: AppFonts.subGreyTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.productModel['createdAt'], style: AppFonts.subGreyTextStyle),
                FavButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
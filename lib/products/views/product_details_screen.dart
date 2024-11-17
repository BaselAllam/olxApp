import 'package:flutter/material.dart';
import 'package:olx/products/views/account_seller_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';
import 'package:olx/shared/shred_widget/fav_button.dart';



class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('Product Details', style: AppFonts.primaryBlacTextStyle),
        leading: CustomBackBtn()
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < 3; i++)
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDIBxtZomfSTeVFkJqWN0itc6Q2FSomDWYnw&s'),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Apple Macbook pro', style: AppFonts.primaryBlacTextStyle),
                  FavButton()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text('Apple Macbook pro laptop new like used Apple Macbook pro laptop new like used Apple Macbook pro laptop new like usedApple Macbook pro laptop new like used Apple Macbook pro laptop new like used', style: AppFonts.subGreyTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Text('Cairo, Egypt', style: AppFonts.subBlacTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('EGP 65.000', style: AppFonts.primaryBlacTextStyle),
                  TextButton(
                    child: Row(
                      children: [
                        Text('Offer a price  ', style: AppFonts.subWhiteyTextStyle),
                        Icon(Icons.handshake, color: AppColors.whiteColor, size: 20.0)
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.orangeColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AccountSellerScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.whiteColor
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    minRadius: 40.0,
                    maxRadius: 40.0,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                  ),
                  title: Text('Bassel Allam', style: AppFonts.subBlacTextStyle),
                  subtitle: Text('Member since Oct 2024', style: AppFonts.subGreyTextStyle),
                  trailing: Icon(Icons.arrow_forward_ios, color: AppColors.blackColor, size: 20.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.whiteColor
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Specifications', style: AppFonts.primaryBlacTextStyle),
                    trailing: Icon(Icons.details, color: AppColors.orangeColor, size: 20.0),
                  ),
                  ListTile(
                    title: Text('Model year', style: AppFonts.subBlacTextStyle),
                    trailing: Text('2020', style: AppFonts.subGreyTextStyle),
                  ),
                  ListTile(
                    title: Text('Battery', style: AppFonts.subBlacTextStyle),
                    trailing: Text('5000 MA', style: AppFonts.subGreyTextStyle),
                  ),
                  ListTile(
                    title: Text('Color', style: AppFonts.subBlacTextStyle),
                    trailing: Text('Silver', style: AppFonts.subGreyTextStyle),
                  ),
                  ListTile(
                    title: Text('Monitor', style: AppFonts.subBlacTextStyle),
                    trailing: Text('Full HD', style: AppFonts.subGreyTextStyle),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
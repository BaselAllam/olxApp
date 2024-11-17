import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';
import 'package:olx/shared/shred_widget/product_widget.dart';



class AccountSellerScreen extends StatefulWidget {
  const AccountSellerScreen({super.key});

  @override
  State<AccountSellerScreen> createState() => _AccountSellerScreenState();
}

class _AccountSellerScreenState extends State<AccountSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('Account Seller', style: AppFonts.primaryBlacTextStyle),
        leading: CustomBackBtn()
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: 75.0,
              child: ListTile(
                leading: CircleAvatar(
                  minRadius: 40.0,
                  maxRadius: 40.0,
                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                ),
                title: Text('Bassel Allam', style: AppFonts.subBlacTextStyle),
                subtitle: Text('Member since Oct 2024', style: AppFonts.subGreyTextStyle),
                trailing: Icon(Icons.share, color: AppColors.blackColor, size: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    padding: EdgeInsets.only(right: 10.0),
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.whiteColor
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Overall Rating', style: TextStyle(color: AppColors.greyThreeColor, fontSize: 15.0)),
                        Text('4', style: TextStyle(color: AppColors.blackColor, fontSize: 30.0)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20.0),
                            Icon(Icons.star, color: Colors.amber, size: 20.0),
                            Icon(Icons.star, color: Colors.amber, size: 20.0),
                            Icon(Icons.star, color: Colors.amber, size: 20.0),
                            Icon(Icons.star, color: Colors.grey, size: 20.0),
                          ],
                        ),
                        Text('5525 Rating', style: AppFonts.subGreyTextStyle),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 1.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.whiteColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < 5; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('5 ⭐', style: TextStyle(color: Colors.amber, fontSize: 15.0)),
                            Container(
                              height: 8.0,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.amber
                                    ),
                                  ),
                                  Container(
                                    width: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: AppColors.greyThreeColor
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text('5525', style: AppFonts.subGreyTextStyle),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Seller Products', style: AppFonts.primaryBlacTextStyle),
            ),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          ],
        ),
      ),
    );
  }
}
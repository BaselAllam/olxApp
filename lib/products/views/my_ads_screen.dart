import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/notification_widget.dart';



class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('My Ads', style: AppFonts.primaryBlacTextStyle),
        actions: [NotificationWidget()],
      ),
      body: Container(
        child: ListView(
          children: [
            for (int i = 0; i < 5; i++)
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.orangeColor,
                        ),
                        alignment: Alignment.center,
                        child: Text('Active', style: AppFonts.subWhiteyTextStyle),
                      ),
                      Text('  from 10 Sep 2023 - to 30 Sep 2023  ', style: AppFonts.subGreyTextStyle),
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: AppColors.greyThreeColor,
                        iconSize: 20.0,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.whiteColor
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDIBxtZomfSTeVFkJqWN0itc6Q2FSomDWYnw&s'),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\nMacbook pro M1', style: AppFonts.subBlacTextStyle),
                              Text('EGP 50K', style: AppFonts.primaryBlacTextStyle),
                              Text('Cairo, Egypt', style: AppFonts.subBlacTextStyle),
                              Text('\nThis app is currently live', style: AppFonts.subBlacTextStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
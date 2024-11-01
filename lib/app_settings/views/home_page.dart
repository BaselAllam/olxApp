import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/category_widget.dart';
import 'package:olx/shared/utils/app_assets.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  Map<String, String> categories = {
    'Animals': AppAssets.animalIcon,
    'Bikes': AppAssets.bikeIcon,
    'Business': AppAssets.businessIcon,
    'Electronics': AppAssets.electronicsIcon,
    'Fashion': AppAssets.fashionIcon,
    'Furniture': AppAssets.furnitureIcon,
    'Jobs': AppAssets.jobIcon,
    'Kids': AppAssets.kidsIcons,
    'Property': AppAssets.propertyIcon
  };

  List images = [
    'https://images.pexels.com/photos/298842/pexels-photo-298842.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/253096/pexels-photo-253096.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4158/apple-iphone-smartphone-desk.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Image.network('https://lh5.ggpht.com/Yasg3Qc67FruAHv16MwvXPn1dG93B4wVe1TxLwVnN-ADT-GgPt7cBm1NgW7XYsDu_A', height: 50.0, width: 50.0),
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                shape: BoxShape.circle
              ),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              child: Icon(Icons.notifications, color: AppColors.whiteColor, size: 20.0)
            ),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            buildBannersSection(),
            ListTile(
              title: Text('Categories', style: AppFonts.primaryBlacTextStyle),
              trailing: Text('See all', style: AppFonts.subGreyTextStyle),
              onTap: () {}
            ),
            buildCategorySection(),
          ],
        ),
      ),
    );
  }

  buildBannersSection() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (String i in images)
              Container(
                margin: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(i),
                    fit: BoxFit.fill
                  )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildCategorySection() {
    return Column(
      children: [
        Container(
          height: 65.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (String key in categories.keys)
              CategoryWidget(categoryName: key, img: categories[key]!)
            ],
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/home_page.dart';
import 'package:olx/products/views/my_ads_screen.dart';
import 'package:olx/products/views/sell_screen.dart';
import 'package:olx/products/views/wishlist_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/users/views/profile_screen.dart';



class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  List<Widget> screens = [HomePageScreen(), WishlistScreen(), SellScreen(), MyAdsScreen(), ProfileScreen()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Sell'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My Ads'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
        selectedIconTheme: IconThemeData(color: AppColors.orangeColor, size: 25.0),
        unselectedIconTheme: IconThemeData(color: AppColors.blackColor, size: 25.0),
        selectedItemColor: AppColors.orangeColor,
        unselectedItemColor: AppColors.blackColor,
        selectedLabelStyle: AppFonts.miniOrangeTextStyle,
        unselectedLabelStyle: AppFonts.miniBlacTextStyle,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: screens[currentIndex]
    );
  }
}
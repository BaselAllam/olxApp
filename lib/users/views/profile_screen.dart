import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/setting_screen.dart';
import 'package:olx/products/views/recent_bought_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/notification_widget.dart';
import 'package:olx/users/views/edit_profile_screen.dart';
import 'package:olx/users/views/payment_screen.dart';
import 'package:olx/users/views/wallet_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<Map<String, dynamic>> sections = [
    {
      'icon': Icons.edit_square,
      'title': 'Edit Profile',
      'screen': EditProfileScreen()
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
      'screen': SettingsScreen()
    },
    {
      'icon': Icons.wallet,
      'title': 'Wallet',
      'screen': WalletScreen()
    },
    {
      'icon': Icons.payment,
      'title': 'Payment',
      'screen': PaymentScreen()
    },
    {
      'icon': Icons.restore_rounded,
      'title': 'Recent bought',
      'screen': RecentBoughtScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('Profile', style: AppFonts.primaryBlacTextStyle),
        actions: [NotificationWidget()],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                ),
                Text('Bassel Allam', style: AppFonts.primaryBlacTextStyle)
              ],
            ),
            for (Map<String, dynamic> section in sections)
            ListTile(
              leading: Icon(section['icon'], color: AppColors.orangeColor, size: 20.0),
              title: Text(section['title'], style: AppFonts.subBlacTextStyle),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.blackColor, size: 20.0),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => section['screen']));
              },
            ),
            Divider(endIndent: 20.0, indent: 20.0, color: AppColors.greyTwoColor, thickness: 0.3),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.orangeColor, size: 20.0),
              title: Text('Logout', style: AppFonts.subBlacTextStyle),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.whiteColor,
                      content: Text('Are you sure you want to Logout', style: AppFonts.primaryBlacTextStyle),
                      actions: [
                        TextButton(
                          child: Text('No', style: AppFonts.subWhiteyTextStyle),
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.orangeColor,
                            fixedSize: Size(0.0, 50.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text('Yes', style: AppFonts.subOrangeTextStyle),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            fixedSize: Size(0.0, 50.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ),
                          onPressed: () async {
                            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                            sharedPreferences.clear();
                          },
                        ),
                      ],
                    );
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
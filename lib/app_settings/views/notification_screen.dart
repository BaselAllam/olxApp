import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('Notifications', style: AppFonts.primaryBlacTextStyle),
        leading: CustomBackBtn()
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.circle, color: AppColors.orangeColor, size: 20.0),
            title: Text('your ad has been approved', style: AppFonts.subBlacTextStyle),
            subtitle: Text('your car ad has been approved, buyers can now view your ad and get offers', style: AppFonts.subGreyTextStyle),
            trailing: Text('14-May-2024\n10:00AM', style: AppFonts.miniOrangeTextStyle),
          ),
        ),
      ),
    );
  }
}
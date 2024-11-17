import 'package:flutter/material.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';



class RecentBoughtScreen extends StatefulWidget {
  const RecentBoughtScreen({super.key});

  @override
  State<RecentBoughtScreen> createState() => _RecentBoughtScreenState();
}

class _RecentBoughtScreenState extends State<RecentBoughtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('Recent Bought', style: AppFonts.primaryBlacTextStyle),
        leading: CustomBackBtn()
      ),
    );
  }
}
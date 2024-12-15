import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/app_settings/views/home_page.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/views/search_result_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';



class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('All Categories', style: AppFonts.primaryBlacTextStyle),
        leading: CustomBackBtn()
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            for (String key in categories.keys)
            ListTile(
              leading: Image.asset(categories[key]!, height: 25, width: 30.0),
              title: Text(key, style: AppFonts.subBlacTextStyle),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.blackColor, size: 20.0),
              onTap: () {
                BlocProvider.of<ProductCubit>(context).filterCategory(key);
                Navigator.push(context, MaterialPageRoute(builder: (_) => SearchResultScreen(screenTitle: key, isAllProducts: false)));
              },
            ),
          ]
        ),
      ),
    );
  }
}
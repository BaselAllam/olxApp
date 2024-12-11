import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/logic/product_state.dart';
import 'package:olx/products/views/all_categories_screen.dart';
import 'package:olx/products/views/search_result_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/category_widget.dart';
import 'package:olx/shared/shred_widget/notification_widget.dart';
import 'package:olx/shared/shred_widget/product_widget.dart';
import 'package:olx/shared/utils/app_assets.dart';

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


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Image.network('https://lh5.ggpht.com/Yasg3Qc67FruAHv16MwvXPn1dG93B4wVe1TxLwVnN-ADT-GgPt7cBm1NgW7XYsDu_A', height: 50.0, width: 50.0),
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        actions: [
          NotificationWidget()
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            buildBannersSection(),
            buildSectionTitle('Categories', AllCategoriesScreen()),
            buildCategorySection(),
            buildSectionTitle('Recently Viewed', SearchResultScreen(screenTitle: 'Recently Viewed',)),
            buildProductsSection()
          ],
        ),
      ),
    );
  }

  buildSectionTitle(String title, Widget screen) {
    return ListTile(
      title: Text(title, style: AppFonts.primaryBlacTextStyle),
      trailing: Text('See all', style: AppFonts.subGreyTextStyle),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      }
    );
  }

  buildBannersSection() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetHeadersLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetHeadersErrorState) {
          return Center(child: Text('Some thing went wrong', style: AppFonts.primaryBlacTextStyle));
        } else if (BlocProvider.of<ProductCubit>(context).headers.isEmpty) {
          return Center(child: Text('There is no banners now', style: AppFonts.primaryBlacTextStyle));
        } else {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (String i in BlocProvider.of<ProductCubit>(context).headers)
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width / 1.2,
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
      },
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

  buildProductsSection() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetProductsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is  GetProductsErrorState) {
          return Center(child: Text('Some thing went wrong', style: AppFonts.primaryBlacTextStyle));
        } else if (BlocProvider.of<ProductCubit>(context).allProducts.isEmpty) {
          return Center(child: Text('There is no products now', style: AppFonts.primaryBlacTextStyle));
        } else {
          return Column(
            children: [
              Container(
                height: 320.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: BlocProvider.of<ProductCubit>(context).allProducts.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(productModel: BlocProvider.of<ProductCubit>(context).allProducts[index]);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
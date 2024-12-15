import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/logic/product_model.dart';
import 'package:olx/products/logic/product_state.dart';
import 'package:olx/products/views/account_seller_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/back_btn_widget.dart';
import 'package:olx/shared/shred_widget/fav_button.dart';



class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;
  ProductDetailsScreen({required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  LatLng defaultPosition = LatLng(-0.936, -98.0539);

  bool isMapLoading = true;

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

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
                  // for (int i = 0; i < 3; i++)
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(widget.productModel.productImg),
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
                  Text(widget.productModel.productName, style: AppFonts.primaryBlacTextStyle),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) => FavButton(productModel: widget.productModel)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(widget.productModel.productDescription, style: AppFonts.subGreyTextStyle),
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
                  Text('EGP ${widget.productModel.productPrice}', style: AppFonts.primaryBlacTextStyle),
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
            ),
            Container(
              height: 250.0,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.whiteColor
              ),
              padding: EdgeInsets.all(10.0),
              child: isMapLoading ? Center(child: CircularProgressIndicator()) : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: defaultPosition,
                  zoom: 12
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getUserLocation() async {
    isMapLoading = true;
    setState(() {});
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    Position currentPosition = await Geolocator.getCurrentPosition();
    defaultPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
    isMapLoading = false;
    setState(() {});
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/app_settings/views/home_page.dart';
import 'package:olx/products/logic/product_cubit.dart';
import 'package:olx/products/logic/product_state.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/notification_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:olx/shared/shred_widget/snack_widget.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {

  TextEditingController adTitleController = TextEditingController();
  TextEditingController adDecriptionController = TextEditingController();
  TextEditingController adPriceController = TextEditingController();
  String selectedCategory = 'Select Category';

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backGroundColor,
        title: Text('Sell', style: AppFonts.primaryBlacTextStyle),
        actions: [
          NotificationWidget()
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),  
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors.whiteColor,
                image: pickedImage == null ? DecorationImage(
                  image: NetworkImage('https://images.pexels.com/photos/102155/pexels-photo-102155.jpeg?auto=compress&cs=tinysrgb&w=600'),
                  fit: BoxFit.fill
                ) : DecorationImage(
                  image: FileImage(pickedImage!),
                  fit: BoxFit.fill
                )
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    color: AppColors.orangeColor,
                    iconSize: 40.0,
                    onPressed: () async {
                      pickImg(ImageSource.camera);
                    },
                  ),
                  Text('Add Image', style: AppFonts.subOrangeTextStyle),
                  Text('upload up to 20 images', style: AppFonts.miniOrangeTextStyle),
                ],
              ),
            ),
            ListTile(
              title: Text('Ad Category', style: AppFonts.primaryBlacTextStyle),
              subtitle: Text(selectedCategory, style: AppFonts.subGreyTextStyle),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_downward, color: AppColors.orangeColor, size: 20.0),
                onSelected: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    for (String i in categories.keys)
                    PopupMenuItem(
                      child: Text(i, style: AppFonts.subBlacTextStyle),
                      value: i,
                    )
                  ];
                },
              ),
            ),
            ListTile(
              title: Text('Ad Title', style: AppFonts.primaryBlacTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: adTitleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyThreeColor, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyThreeColor, width: 0.5)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red, width: 0.5)
                    ),
                    labelText: 'EX: Apple Macbook pro for sale',
                    labelStyle: AppFonts.subGreyTextStyle,
                    prefixIcon: Icon(Icons.title, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            ListTile(
              title: Text('Ad Decription', style: AppFonts.primaryBlacTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: adDecriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyThreeColor, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyThreeColor, width: 0.5)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red, width: 0.5)
                    ),
                    labelText: 'EX: Apple Macbook pro for sale like new and so on',
                    labelStyle: AppFonts.subGreyTextStyle,
                    prefixIcon: Icon(Icons.text_fields, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            ListTile(
              title: Text('Ad Price', style: AppFonts.primaryBlacTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: adPriceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyThreeColor, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyThreeColor, width: 0.5)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red, width: 0.5)
                    ),
                    labelText: '20000 EGP',
                    labelStyle: AppFonts.subGreyTextStyle,
                    prefixIcon: Icon(Icons.attach_money, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            BlocListener<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is CreateProductSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar('Created Success', Colors.green));
                } else if (state is CreateProductFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar('Created Failed', Colors.red));
                }
              },
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is CreateProductLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return TextButton(
                      child: Text('Sell Now', style: AppFonts.subWhiteyTextStyle),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.orangeColor,
                        fixedSize: Size(0.0, 50.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                      ),
                      onPressed: () {
                        if (adTitleController.text.isEmpty || adDecriptionController.text.isEmpty || adPriceController.text.isEmpty || selectedCategory == 'Select Category') {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar('Some Fields Empty', Colors.red));
                        } else {
                          BlocProvider.of<ProductCubit>(context).createProduct(
                            selectedCategory,
                            adTitleController.text,
                            adDecriptionController.text,
                            num.parse(adPriceController.text)
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  pickImg(ImageSource imageSource) async {
    var img = await ImagePicker().pickImage(source: imageSource);
    setState(() {
      pickedImage = File(img!.path);
    });
  }
}
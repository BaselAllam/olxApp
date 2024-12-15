import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/bottom_nav_bar.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';
import 'package:olx/shared/shared_theme/app_fonts.dart';
import 'package:olx/shared/shred_widget/snack_widget.dart';
import 'package:olx/shared/utils/init_data.dart';
import 'package:olx/users/views/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Welcome back!', style: TextStyle(color: AppColors.blackColor, fontSize: 40.0, fontWeight: FontWeight.bold)),
              subtitle: Text('Login to your account!', style: AppFonts.primaryGreyTextStyle,),
            ),
            ListTile(
              title: Text('Email', style: AppFonts.primaryBlacTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: emailController,
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
                    labelText: 'Email Address',
                    labelStyle: AppFonts.subGreyTextStyle,
                    prefixIcon: Icon(Icons.email, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            ListTile(
              title: Text('Password', style: AppFonts.primaryBlacTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: passwordController,
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
                    labelText: 'Password',
                    labelStyle: AppFonts.subGreyTextStyle,
                    prefixIcon: Icon(Icons.lock, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text('Forget password?', style: AppFonts.subGreyTextStyle),
                ),
                onTap: () {},
              )
            ),
            TextButton(
              child: Text('Login', style: AppFonts.subWhiteyTextStyle),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.orangeColor,
                fixedSize: Size(0.0, 50.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              onPressed: () async {
                if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar('Email & Password Required', Colors.red));
                } else {
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setBool('isLoggedIn', true);
                  await initDataMethod(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavBarScreen()));
                }
              },
            ),
            SizedBox(height: 50.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Don\'t have an account ?', style: AppFonts.subGreyTextStyle),
                  InkWell(
                    child: Text('  Signup', style: AppFonts.subOrangeTextStyle),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
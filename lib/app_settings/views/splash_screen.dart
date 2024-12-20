import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/bottom_nav_bar.dart';
import 'package:olx/shared/utils/init_data.dart';
import 'package:olx/users/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: initData(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<bool> initData() async {
    await Future.delayed(Duration(seconds: 5));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPreferences.getBool('isLoggedIn');
    if (isLoggedIn == null || isLoggedIn == false) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } else {
      await initDataMethod(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavBarScreen()));
    }
    
    return true;
  }
}
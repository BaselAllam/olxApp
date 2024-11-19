import 'package:flutter/material.dart';
import 'package:olx/users/views/login_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}


// UI Design => https://www.behance.net/gallery/182489779/Dubizzle-App-Redesign?tracking_source=search_projects|dubizzle&l=31


/*

  Next Session
    - Packages & Libraries
      - Splash Screen
      - Launcher Icon
      - SharedPreferences
      - Device Camera
      - Google Maps ( Geolocator, Flutter Google Map ) => just install

  Next Session
    - Integrate Google Map
    - Use Google Map & Geolocator
    - Integrate Firebase


  Next 2 Session
    - Intro to State Managment
    - How to use State Managment

  Next Session 
    - Responsive Design
    - Release App 

*/
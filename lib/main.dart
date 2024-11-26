import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/splash_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}


// UI Design => https://www.behance.net/gallery/182489779/Dubizzle-App-Redesign?tracking_source=search_projects|dubizzle&l=31


/*

  Next Session
    - Integrate Firebase
    - Intro to State Managment
    - How to use State Managment

  Next Session 
    - Responsive Design
    - Release App 

*/
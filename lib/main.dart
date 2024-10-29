import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/home_page.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),
    );
  }
}


// UI Design => https://www.behance.net/gallery/182489779/Dubizzle-App-Redesign?tracking_source=search_projects|dubizzle&l=31


/*

Today Agenda

  ListView.builder & GridView Widget
  BottomNavigationBar
  Navigation push & pop


*/
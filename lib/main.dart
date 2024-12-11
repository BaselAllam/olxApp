import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/app_settings/views/splash_screen.dart';
import 'package:olx/products/logic/product_cubit.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
      ),
    );
  }
}




/*

  Next Session 
    - Filter Category Function
    - Responsive Design
    - Release App 

*/

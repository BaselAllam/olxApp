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


// UI Design => https://www.behance.net/gallery/182489779/Dubizzle-App-Redesign?tracking_source=search_projects|dubizzle&l=31


/*

  Next Session
    - Intro to State Managment
    - How to use State Managment & App Implementation

  Next Session 
    - Responsive Design
    - Release App 

*/



/*


  Back-end Developer
    - Database
    - Back-end Tech
    - EndPoint


  Login
    email
    password

    https://itshare.com/login

    JSON (MAP) => Java Script Object Notiation

    response ( body, status code )



  ENDPOINT
    => path on the server that contains a method that responsible for specific task

    HTTP Request => ( Protocol )
      URL => path function ( itshare.com/login )
      BODY => the place of hold data
        JSON content ( encode )
      HEADER => place to additional data 

    HTTP Response => ( Result of Request )
      BODY => the place of hold data ( recieved from server )
        JSON content ( decode )
      Status Code



  itshare.com/login
  payload => body data ( json ) email:str, password:str
  header => lang:en
  response 
    success 200, user data
    failed 403, unauthorized user
    server down 500 inertnal server error


*/


/*


  Model               Controller               View



  BlocProvider => in main.dart file on top of the MaterialApp widget
    => this class is listeneing on any change happend on any function

  Cubit => class that inherite from in controller to can use emit function
    => what's emit function ? emit function is the function that release the state class to announce 
      bloc provider there is a change happen in this function

  BlocBuilder & BlocListener => these widget being of the top of any widget that need to listen to any change
  


*/
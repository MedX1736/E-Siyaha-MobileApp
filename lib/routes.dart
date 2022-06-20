import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/screens/Login_Screen.dart';
import 'package:flutter_e_siyaha/screens/mapScreen.dart';
import 'package:flutter_e_siyaha/screens/splash_screen.dart';
import 'screens/SignUp_screen.dart';

final Map<String,WidgetBuilder> routes = {
      SplashScreen.routename: (context) => SplashScreen(),
      SignUpScreen.routename: (context) => SignUpScreen(),
       LoginScreen.routename :(context) => LoginScreen(), 
       MapScreen.routename :(context) => MapScreen(), 
}; 
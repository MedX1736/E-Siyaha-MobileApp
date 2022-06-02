import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/screens/splash_screen.dart';

final Map<String,WidgetBuilder> routes = {
      SplashScreen.routename: (context) => SplashScreen(),
       SignInScreen.routeName: (context) => SignInScreen(),
}; 
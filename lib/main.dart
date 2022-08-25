import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_e_siyaha/components/Circuit.dart';
import 'package:flutter_e_siyaha/const.dart';
import 'package:flutter_e_siyaha/routes.dart';
import 'package:flutter_e_siyaha/screens/mapScreen.dart';
import 'package:flutter_e_siyaha/screens/mappage.dart';
import 'package:flutter_e_siyaha/screens/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/CircuitCard.dart';
// import 'const.dart' ;
// import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute :MapScreen.routename ,
      title: 'E-Siyaha',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
  

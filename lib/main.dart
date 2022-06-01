import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/screens/mappage.dart';
// import 'const.dart' ; 
// import './screens/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner : false, 
      home: const MapPage(),
    );
  }
}


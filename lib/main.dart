import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_e_siyaha/Circuit.dart';
import 'package:flutter_e_siyaha/const.dart';
import 'package:flutter_e_siyaha/screens/mappage.dart';
import 'package:flutter_e_siyaha/screens/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'CircuitCard.dart';
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
  double opacity = 1;
  Widget widgetText = Text('Veuillez choisir le périmètre',
      style: TextStyle(
        color: kColorGrey,
        fontFamily: 'Lexend',
        fontSize: 14,
      ));

  Color colorContainer = kColorWhite;
  double topContainer = 30;
  BorderRadius borderRadius = BorderRadius.circular(30);

  EdgeInsets edgeInsetMargin =
      EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute :SplashScreen.routename ,
      title: 'E-Siyaha',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }

  
// class TextField2 extends StatelessWidget {
//   const TextField2({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       cursorColor: kColorPurple,
//       decoration: const InputDecoration(
//         fillColor: Colors.red,
//         border: UnderlineInputBorder(),
//         labelText: 'Enter your username',
//       ),
//     );
//   }
// }
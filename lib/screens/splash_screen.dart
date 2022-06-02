import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/const.dart';

class SplashScreen extends StatefulWidget {
  static String routename = "/splash";
  const SplashScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreen();
}
  
class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title,
              style:const  TextStyle(fontFamily : "Lexend",color : kColorPurple, fontSize: 40),
              ), 
      ),
    );
  }
}

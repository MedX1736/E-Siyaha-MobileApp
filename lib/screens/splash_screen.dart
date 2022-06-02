import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routename = "/splash";
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffd8b4ec),
      body: Center(
        child:Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
             image: DecorationImage(image:AssetImage("images/alger11.jpg"),colorFilter: ColorFilter.mode(Colors.deepPurple, BlendMode.color )),
            shape: BoxShape.circle,
          ),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image:AssetImage("images/logo.png"),
                width: 240,
                height:240 ,
                ),
                SizedBox(
                  height: 0,
                ),
                
                Text("Lets discover Algeria !",style:TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),)
              ],
          ),
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_e_siyaha/Circuit.dart';
import 'package:flutter_e_siyaha/const.dart';
import 'package:flutter_e_siyaha/screens/mappage.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //Map
              Positioned.fill(child: MapPage()),
              //TextField
              Positioned(
                  top: topContainer,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 25, right: 25),
                    margin: edgeInsetMargin,
                    decoration: BoxDecoration(
                        color: colorContainer,
                        borderRadius: borderRadius,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: Offset.zero,
                          )
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset('assets/SVGS/menu.svg'),
                          ),
                          InkWell(
                            onTap: () => {
                              setState(() {
                                widgetText = Container(
                                  
                                  child: Text("Alger",style: 
                                  TextStyle(fontFamily: 'Lexend',fontWeight: FontWeight.bold,fontSize: 16)
                                  )
                                );
                                borderRadius = BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20));
                                topContainer = 10;
                                colorContainer = kColorLavender;
                                edgeInsetMargin = EdgeInsets.zero;
                              }),
                            },
                            child: Expanded(
                                child: AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: widgetText,
                            )),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset('assets/SVGS/user.svg'),
                          ),
                        ]),
                  )),
              //Cards
              Padding(
                padding: EdgeInsets.only(bottom: 50,left: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    
                    width: double.infinity,
                    height: 250.0,
                    child: ListView.builder(
                      itemCount: circuitList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var circuit = circuitList[index];
                        return InkWell(
                            onTap: () {}, child: CircuitCard(circuit: circuit));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField2 extends StatelessWidget {
  const TextField2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kColorPurple,
      decoration: const InputDecoration(
        fillColor: Colors.red,
        border: UnderlineInputBorder(),
        labelText: 'Enter your username',
      ),
    );
  }
}

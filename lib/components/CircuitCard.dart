import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../const.dart';
import 'Circuit.dart';

class CircuitCard extends StatelessWidget {
  Function() onTapGo ; 
  Function() onTapMore ; 
  final Circuit circuit;
  CircuitCard({required this.circuit,required this.onTapGo , required this.onTapMore});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        textDirection: TextDirection.rtl,
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        
          children: [
             Positioned(
                child: Container(
                 height : 150,
                 width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kColorPurple.withOpacity(.2),
                        offset: Offset(2,5),
                        blurRadius: 8,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Text(
                            circuit.nomCircuit,
                            style: TextStyle(
                              color: kColorPurple,
                              fontFamily: 'Lexend', 
                              fontWeight: FontWeight.bold, 
                            ),
                          )
                          ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          //Rating
                          Container(
                            width: 70,
                            child: Row(
                              children: [
                              SvgPicture.asset('assets/SVGS/Rate.svg'),
                              SizedBox(width:13),
                              Text('4,5/5',style: TextStyle(color: kColorGrey,fontSize: 14)),
                            ]),
                          ),
                          SizedBox(
                            height:25,
                          ),
                          //Timing 
                          Container(
                            width: 70,
                            child: Row(
                              children: [
                              SvgPicture.asset('assets/SVGS/clock.svg'),
                              SizedBox(width:13),
                              Text('60 min',style: TextStyle(color: kColorGrey,fontSize: 14)),
                            ]),
                          ),
                            SizedBox(
                            height: 25,
                          ),
                          //Km
                          Container(
                            width: 70,
                            child: Row(
                              children: [
                              SvgPicture.asset('assets/SVGS/pin.svg'),
                              SizedBox(width:13),
                              Text('5 km',style: TextStyle(color: kColorGrey,fontSize: 14)),
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset('assets/SVGS/more.svg',width: 30,height: 30,),
                            onTap: onTapMore,
                          ),
                          GestureDetector(
                            child: SvgPicture.asset('assets/SVGS/bxs_share-alt.svg',width: 30,height: 30,),

                          ),
                          GestureDetector(
                            child: SvgPicture.asset('assets/SVGS/Go.svg',width: 30,height: 30,),
                            onTap: onTapGo,
                          ),
                        ],
                      ),

                    ],
                    
                    ),
                ),
             ),
              Positioned(
              
              top:00, 
              left:35,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    
                    boxShadow: [
                      BoxShadow(
                        color: kColorPurple.withOpacity(.1),
                        offset: Offset(1,2),
                        blurRadius: 8,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/img.png',
              ),
            ))  ,
          ],
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'const.dart';
import 'Circuit.dart';

class CircuitCard extends StatelessWidget {
  final Circuit circuit;
  CircuitCard({required this.circuit});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 12.0),
      child: Stack(
        children: [
         Container(
          width: 300.0,
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: kColorLavender,
            boxShadow: [
              BoxShadow(
                color: kColorPurple.withOpacity(.2),
                offset: Offset(2, 5),
                blurRadius: 8,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.white,
                child: Image.network(circuit.imageUrl,width: 18.0,),
                ),
              Text(
                circuit.nomCircuit,
              )
            ],
          ),
        ),
                 
        ],
      ),
    );
  }
}

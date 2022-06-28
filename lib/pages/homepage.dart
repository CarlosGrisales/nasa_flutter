import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  double screenHeight = 0.0, screenWidth = 0.0;
  double height = 0.0;
  double width = 0.0;
  double sizeFactor = 0.0;

  List<double> altos = [];
  List<double> anchos = [];

  List<BorderRadius> borderAnimations = [];
  int generalIndex = 0;

  Color _colorCont = Colors.blueAccent; 

  double anchoActual = 300, altoActual = 300;
  BorderRadius borderActual = BorderRadius.circular(10);

  @override
  void initState() {
    super.initState();
    initParameters();
    initAnimation();
  }

  initParameters() {
    setState(() {
      altos = [
        100,
        200,
        300,
      ];
      anchos = [
        100,
        200,
        300,
      ];

      borderAnimations = [
        BorderRadius.circular(5),
        BorderRadius.circular(10),
        BorderRadius.circular(2),
      ];
    });
  }

  initAnimation() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        altoActual = altos[generalIndex];
        anchoActual = anchos[generalIndex];
        borderActual = borderAnimations[generalIndex];

        print("Entra en $generalIndex");
        generalIndex++;
        if (generalIndex >= 3) generalIndex = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    sizeFactor = screenHeight - screenWidth;
    return Scaffold(
        body: Container(color: Colors.lightBlue, child:
        
        
        Stack(children:[Center(
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        width: anchoActual,
        height: altoActual,
        decoration: BoxDecoration(
          color: _colorCont,
          borderRadius: borderActual,
        ),
       child: Image.asset(
                          'assets/img/tres.png',
                          fit: BoxFit.cover
                          ,
        ),
      ),
    )])));
  }
}

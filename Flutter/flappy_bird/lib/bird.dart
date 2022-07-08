import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset("images/yellowbird1.png"));
  }
}

/*
import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  
  final birdYaxis;
  final double birdHeight;
  final double birdWidth;

  MyBird({
    this.birdYaxis,
    required this.birdWidth,
    required this.birdHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * birdYaxis +birdHeight) / (2 - birdHeight)),
      child: Image.asset(
        "./../images/yellowbird1.png",
        width: MediaQuery.of(context).size.width * birdWidth/2,
        height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight / 2,
        fit: BoxFit.fill,
        )
      );
  }
}

*/
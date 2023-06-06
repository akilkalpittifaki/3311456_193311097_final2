import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdY;
  final double birdWidth; // genişlik
  final double birdHeight; // yükseklik

  MyBird({this.birdY, required this.birdWidth, required this.birdHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, (2 * birdY + birdHeight) / (2 - birdHeight)),
        child: Image.asset(
          'assets/images/ruspng.png',
          width: MediaQuery.of(context).size.height * birdWidth * (1.1),
          height: MediaQuery.of(context).size.height * 1 * birdHeight * (1.1),
          fit: BoxFit.fill,
        ));
  }
}

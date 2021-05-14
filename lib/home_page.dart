import 'dart:math';

import 'package:flutter/material.dart';

class FloatingPage extends StatefulWidget {
  @override
  _FloatingPageState createState() => _FloatingPageState();
}

class _FloatingPageState extends State<FloatingPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationControl;

  Animation<double> rotationValue;
  Animation<double> traslationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationControl = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    );

    rotationValue = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(animationControl);

    traslationValue = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(animationControl);

    animationControl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: animationControl,
        builder: (_, child) => Center(
          child: Stack(children: [
            Positioned(
                top: 100,
                left: traslationValue.value,
                child: Transform(
                    transform: Matrix4.rotationZ(rotationValue.value),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/green.png',
                      height: 160,
                      width: 160,
                    ))),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationControl.dispose();
    super.dispose();
  }
}

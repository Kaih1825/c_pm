import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin {
  late var anicon2;
  late var animation21;
  late var animation22;
  late var anicon1;
  late var animation1;
  late var anicon3;
  late var animation3;
  var showPage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anicon2 = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation21 = Tween(begin: 0.0, end: 0.125).animate(CurvedAnimation(parent: anicon2, curve: Curves.fastLinearToSlowEaseIn));
    animation22 = Tween(begin: 0.0, end: -0.125).animate(CurvedAnimation(parent: anicon2, curve: Curves.fastLinearToSlowEaseIn));
    anicon1 = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation1 = Tween(begin: -160.0, end: 0.0).animate(CurvedAnimation(parent: anicon1, curve: Curves.fastLinearToSlowEaseIn));
    anicon3 = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation3 = Tween(begin: 30.0, end: 50.0).animate(CurvedAnimation(parent: anicon3, curve: Curves.bounceOut));

    Timer(Duration(seconds: 1), () {
      showPage = true;
      anicon1.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          anicon2.forward();
          anicon3.forward();
        }
      });
      anicon1.forward();
      animation1.addListener(() {
        setState(() {});
      });

      anicon2.addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });

      anicon3.addListener(() {
        setState(() {});
      });

      anicon3.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          anicon3.reverse();
        } else if (status == AnimationStatus.dismissed) {
          anicon3.forward();
        }
      });
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    anicon1.dispose();
    anicon2.dispose();
    anicon3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !showPage
          ? Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.pink,
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            "Master SKills\nChange the World",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Image.asset(
                            "res/map.jpeg",
                            width: 500,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: animation3.value),
                            child: Icon(Icons.arrow_downward_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    height: 120,
                  ),
                  Positioned(
                    top: 70.0,
                    child: RotationTransition(
                      alignment: Alignment.topRight,
                      turns: animation21,
                      child: Container(
                        color: Colors.pink,
                        width: Get.width / 2,
                        height: Get.height + 500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 0,
                    child: RotationTransition(
                      turns: animation22,
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.pink,
                        width: Get.width / 2,
                        height: Get.height + 500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: animation1.value,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "res/lamp.png",
                      height: 160,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

var key = GlobalKey();

class _StatisticState extends State<Statistic> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Statistic",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 25,
                  height: 3,
                  color: Colors.pink,
                ),
              ),
              Expanded(
                child: Container(
                  key: key,
                  color: const Color(0xff0E3E71),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          "The numbers of WorldSkills conpetitors",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Diagram(
                                  value: 848,
                                  text: "WorldSkills\nCalgary 2009"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Diagram(
                                  value: 931, text: "WorldSkills\nLondon 2011"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Diagram(
                                  value: 1004,
                                  text: "WorldSkills\nLeipzig 2013"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Diagram(
                                  value: 1186,
                                  text: "WorldSkills\nSão Paulo 2015"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Diagram(
                                  value: 1253,
                                  text: "WorldSkills\nAbu Dhabi 2017"),
                            ),
                            Diagram(
                                value: 1355, text: "WorldSkills\nKazan 2019"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "res/pattern.png",
                            repeat: ImageRepeat.repeatX,
                            height: 90,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Diagram extends StatefulWidget {
  final int value;
  final String text;
  const Diagram({super.key, required this.value, required this.text});

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> with TickerProviderStateMixin {
  late var animation =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  late var tween = Tween(begin: 0.0, end: 1.0).animate(animation);
  var height = 50.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      height =
          (key.currentContext!.findRenderObject() as RenderBox).size.height /
              1.6;
      setState(() {});
      animation.forward();
      animation.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animation.stop();
    animation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${(widget.value * animation.value).toInt()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                width: 20,
                height: height,
                color: Color(0xff082C51),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedContainer(
                  width: 20,
                  height: (widget.value) / 1500 * height,
                  color: Colors.blue.shade400,
                  duration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

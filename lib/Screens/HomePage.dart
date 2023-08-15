import 'package:c_pm/Screens/About.dart';
import 'package:c_pm/Screens/Statistic.dart';
import 'package:flutter/material.dart';

import 'Photos.dart';
import 'Skills.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var titles = ["About", "Statistic", "Photos", "Skills"];
  var pages = [const About(), const Statistic(), const Photos(), const Skills()];
  var selected = 0;
  var controller = PageController();
  late var animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late var offset = Tween(begin: 0.0, end: 0.0).animate(animationController);
  late var offsetValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      offsetValue = controller.page! * 50;
      setState(() {});
    });
    animationController.addListener(() {
      offsetValue = offset.value;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Image.asset(
                      "res/logo.png",
                      color: Colors.pink,
                      width: 200,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: offsetValue),
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.pink,
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            for (var i = 0; i < titles.length; i++)
                              InkWell(
                                onTap: () {
                                  offset = Tween(begin: 50.0 * selected, end: 50.0 * i).animate(animationController);
                                  if (animationController.status == AnimationStatus.completed) {
                                    animationController.reset();
                                  }
                                  animationController.forward();
                                  selected = i;
                                  // controller.jumpToPage(selected);
                                  controller.animateToPage(selected, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                                  setState(() {});
                                },
                                child: SizedBox(
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(titles[i]),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                // child: GetMaterialApp(
                //   debugShowCheckedModeBanner: false,
                //   home: PageView(
                //     controller: controller,
                //     scrollDirection: Axis.vertical,
                //     children: pages,
                //   ),
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

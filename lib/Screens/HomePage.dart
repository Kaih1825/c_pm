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

class _HomePageState extends State<HomePage> {
  var titles = ["About", "Statistic", "Photos", "Skills"];
  var pages = [const About(), const Statistic(), const Photos(), const Skills()];
  var selected = 0;
  var controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      selected = controller.page!.toInt();
      setState(() {});
    });
    super.initState();
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
                    for (var i = 0; i < titles.length; i++)
                      InkWell(
                        onTap: () {
                          selected = i;
                          // controller.jumpToPage(selected);
                          controller.animateToPage(selected, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 50,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    color: i == selected ? Colors.pink : Colors.transparent,
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: i == selected ? Colors.white : Colors.transparent,
                                    ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(titles[i]),
                              ),
                            ],
                          ),
                        ),
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

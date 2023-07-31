import 'package:c_pm/Screens/About.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titles = ["About", "Statistic", "Photos", "Skills"];
  var selected = 0;

  @override
  void initState() {
    // TODO: implement initState
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
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: About(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

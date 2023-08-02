import 'dart:convert';

import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  var controller = PageController(viewportFraction: 0.9);
  var skills = [];
  var nowPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      nowPage = controller.page!.toInt();
      setState(() {});
    });
    parseJson();
  }

  void parseJson() async {
    var json = jsonDecode(await DefaultAssetBundle.of(context).loadString("res/skills.json"));
    for (var i = 0; i < 5; i++) {
      skills.add(json[i]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Skills",
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
              child: PageView.builder(
                controller: controller,
                itemCount: skills.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Image.network(
                                skills[index]["Image"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Column(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            color: Colors.pink,
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  right: 0,
                                                  child: ClipPath(
                                                    clipper: Triangle(),
                                                    child: Container(
                                                      width: 100,
                                                      height: 180,
                                                      color: Colors.pink,
                                                      child: Wrap(
                                                        children: List.generate(2000, (index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(bottom: 10, left: 10),
                                                            child: Container(
                                                              width: 10,
                                                              height: 10,
                                                              color: Colors.yellow,
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(30.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        skills[index]["Name"],
                                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                                                      ),
                                                      Expanded(
                                                        child: SingleChildScrollView(
                                                          child: Text(
                                                            skills[index]["Description"],
                                                            style: const TextStyle(color: Colors.white, fontSize: 15),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      nowPage != index
                          ? Container(
                              color: Colors.white.withOpacity(0.5),
                            )
                          : SizedBox(
                              width: 0,
                              height: 0,
                            )
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (nowPage != 0) {
                      nowPage--;
                      controller.animateToPage(nowPage, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.pink.withOpacity(nowPage == 0 ? 0.2 : 1.0), width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.pink.withOpacity(nowPage == 0 ? 0.2 : 1.0),
                        size: 15,
                      ),
                    ),
                  ),
                ),
                for (var i = 0; i < skills.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: nowPage == i ? Colors.pink : Colors.pink.withOpacity(0.2), borderRadius: BorderRadius.circular(360)),
                      width: 15,
                      height: 15,
                    ),
                  ),
                InkWell(
                  onTap: () {
                    if (nowPage != skills.length - 1) {
                      nowPage++;
                      controller.animateToPage(nowPage, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.pink.withOpacity(nowPage == skills.length - 1 ? 0.2 : 1.0), width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.pink.withOpacity(nowPage == skills.length - 1 ? 0.2 : 1.0),
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Triangle extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

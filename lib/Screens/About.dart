import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

late AnimationController aboutAni;
var aboutCon = 0;

List<Widget> stackChildren = [];

class _AboutState extends State<About> with TickerProviderStateMixin {
  GlobalKey stackKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutAni = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
    aboutAni.addListener(() {
      setState(() {});
    });
  }

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
              InkWell(
                onTap: () {
                  // var tmp = stackChildren[2];
                  // stackChildren[2] = stackChildren[aboutCon];
                  // stackChildren[aboutCon] = tmp;
                },
                child: const Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
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
                child: ClipRect(
                  child: MaterialApp(
                    color: Colors.transparent,
                    debugShowCheckedModeBanner: false,
                    home: Scaffold(
                      body: Builder(builder: (context) {
                        stackChildren = [
                          Align(
                            key: const Key("0"),
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: stackKey.currentContext == null
                                  ? 100
                                  : aboutCon == 0
                                      ? (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 * 2 +
                                          ((stackKey.currentContext!.findRenderObject() as RenderBox).size.width -
                                                  (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 * 2) *
                                              aboutAni.value
                                      : (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 * 2,
                              height: stackKey.currentContext == null
                                  ? 100
                                  : aboutCon == 0
                                      ? (stackKey.currentContext!.findRenderObject() as RenderBox).size.height / 2 +
                                          ((stackKey.currentContext!.findRenderObject() as RenderBox).size.height -
                                                  (stackKey.currentContext!.findRenderObject() as RenderBox).size.height / 2) *
                                              aboutAni.value
                                      : (stackKey.currentContext!.findRenderObject() as RenderBox).size.height / 2,
                              child: AboutBlock(
                                text: "Inspire",
                                image: "res/a1.jpg",
                                color: Colors.blue.shade700.withOpacity(0.5),
                                item: 0,
                              ),
                            ),
                          ),
                          Align(
                            key: const Key("1"),
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: stackKey.currentContext == null
                                  ? 100
                                  : aboutCon == 1
                                      ? (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 * 2 +
                                          ((stackKey.currentContext!.findRenderObject() as RenderBox).size.width -
                                                  (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 * 2) *
                                              aboutAni.value
                                      : (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 * 2,
                              height: stackKey.currentContext == null
                                  ? 100
                                  : aboutCon == 1
                                      ? (stackKey.currentContext!.findRenderObject() as RenderBox).size.height / 2 +
                                          ((stackKey.currentContext!.findRenderObject() as RenderBox).size.height -
                                                  (stackKey.currentContext!.findRenderObject() as RenderBox).size.height / 2) *
                                              aboutAni.value
                                      : (stackKey.currentContext!.findRenderObject() as RenderBox).size.height / 2,
                              child: AboutBlock(
                                text: "Develop",
                                image: "res/a2.jpg",
                                color: Colors.purple.shade500.withOpacity(0.5),
                                item: 1,
                              ),
                            ),
                          ),
                          Align(
                            key: const Key("2"),
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: stackKey.currentContext == null
                                  ? 100
                                  : aboutCon == 2
                                      ? (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3 +
                                          ((stackKey.currentContext!.findRenderObject() as RenderBox).size.width -
                                                  (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3) *
                                              aboutAni.value
                                      : (stackKey.currentContext!.findRenderObject() as RenderBox).size.width / 3,
                              height: stackKey.currentContext == null ? 100 : (stackKey.currentContext!.findRenderObject() as RenderBox).size.height,
                              child: AboutBlock(
                                text: "Influence",
                                image: "res/a3.jpg",
                                color: Colors.pink.shade500.withOpacity(0.5),
                                item: 2,
                              ),
                            ),
                          ),
                        ];
                        stackChildren.sort((a, b) {
                          return a.key == Key(aboutCon.toString()) ? 1 : 0;
                        });
                        return Stack(
                          key: stackKey,
                          children: stackChildren,
                        );
                      }),
                    ),
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

class AboutBlock extends StatefulWidget {
  final String text;
  final String image;
  final Color color;
  final int item;
  const AboutBlock({super.key, required this.text, required this.image, required this.color, required this.item});

  @override
  State<AboutBlock> createState() => _AboutBlockState();
}

class _AboutBlockState extends State<AboutBlock> {
  var showBig = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
        if (!showBig) {
          aboutCon = widget.item;
          aboutAni.forward();
          showBig = true;
        } else {
          aboutAni.reverse();
          showBig = false;
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                widget.image,
                colorBlendMode: BlendMode.modulate,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: widget.color,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      showBig
                          ? """WorldSkills has built a movement that is changing the lives of young people through skills. Our 85 Member organizations reach two-thirds of the world’s population and create measurable impact at every level.

They build the confidence of millions of young people, empowering communities and fueling economies.

WorldSkills is a movement of change."""
                          : "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

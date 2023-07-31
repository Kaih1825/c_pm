import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  var key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
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
              const Text(
                "About",
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
                child: Stack(
                  key: key,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: key.currentContext == null
                            ? 50
                            : (key.currentContext!.findRenderObject()!
                                        as RenderBox)
                                    .size
                                    .width /
                                2,
                        height: key.currentContext == null
                            ? 50
                            : (key.currentContext!.findRenderObject()!
                                        as RenderBox)
                                    .size
                                    .height /
                                2,
                        child: InkWell(
                          onTap: () {
                            print("ss");
                            setState(() {});
                          },
                          child: Image.asset(
                            "res/a1.jpg",
                            fit: BoxFit.cover,
                            color: Colors.blue.shade200,
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: key.currentContext == null
                            ? 50
                            : (key.currentContext!.findRenderObject()!
                                        as RenderBox)
                                    .size
                                    .width /
                                2,
                        height: key.currentContext == null
                            ? 50
                            : (key.currentContext!.findRenderObject()!
                                        as RenderBox)
                                    .size
                                    .height /
                                2,
                        child: Image.asset(
                          "res/a3.jpg",
                          fit: BoxFit.cover,
                          color: Colors.purple.shade900,
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: key.currentContext == null
                            ? 50
                            : (key.currentContext!.findRenderObject()!
                                        as RenderBox)
                                    .size
                                    .width /
                                2,
                        height: double.infinity,
                        child: Image.asset(
                          "res/a2.jpg",
                          fit: BoxFit.cover,
                          color: Color(0xffff50fd),
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

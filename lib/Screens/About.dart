import 'package:c_pm/Screens/AboutDetail.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                    body: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: const [
                              Expanded(
                                flex: 1,
                                child: AboutBlock(
                                  text: "Inspire",
                                  image: "res/a1.jpg",
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: AboutBlock(
                                  text: "Develop",
                                  image: "res/a2.jpg",
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: AboutBlock(
                            text: "Influence",
                            image: "res/a3.jpg",
                            color: Colors.pink,
                          ),
                        ),
                      ],
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
  final context;
  final String image;
  final Color color;
  const AboutBlock(
      {super.key,
      required this.text,
      required this.image,
      required this.color,
      this.context});

  @override
  State<AboutBlock> createState() => _AboutBlockState();
}

class _AboutBlockState extends State<AboutBlock> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.context == null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return AboutDetail(
                text: widget.text,
                image: widget.image,
                color: widget.color,
                context:
                    """WorldSkills has built a movement that is changing the lives of young people through skills. Our 85 Member organizations reach two-thirds of the world’s population and create measurable impact at every level.

They build the confidence of millions of young people, empowering communities and fueling economies.

WorldSkills is a movement of change.""");
          }));
        } else {
          Navigator.pop(context);
        }
      },
      child: Stack(
        children: [
          Hero(
            tag: "tag${widget.text}",
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                widget.image,
                color: widget.color,
                colorBlendMode: BlendMode.modulate,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  widget.context ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

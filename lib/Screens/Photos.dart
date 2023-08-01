import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: const [
                              Flexible(
                                flex: 1,
                                child: PhtotBlock(
                                  image: 1,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: PhtotBlock(
                                  image: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: const [
                              Flexible(
                                flex: 1,
                                child: PhtotBlock(
                                  image: 3,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: PhtotBlock(
                                  image: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Flexible(
                          flex: 1,
                          child: PhtotBlock(
                            image: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        const Flexible(
                          flex: 2,
                          child: PhtotBlock(
                            image: 6,
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: const [
                              Flexible(
                                flex: 1,
                                child: PhtotBlock(
                                  image: 7,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: PhtotBlock(
                                  image: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PhtotBlock extends StatefulWidget {
  final int image;
  const PhtotBlock({super.key, required this.image});

  @override
  State<PhtotBlock> createState() => _PhtotBlockState();
}

class _PhtotBlockState extends State<PhtotBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: OpenContainer(
          closedBuilder: (BuildContext context, void Function() action) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Hero(
                tag: "${widget.image}Photo",
                child: Image.asset(
                  "res/s${widget.image}.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          openBuilder: (BuildContext context,
              void Function({Object? returnValue}) action) {
            return FullScreenPhoto(image: widget.image);
          },
        ));
  }
}

class FullScreenPhoto extends StatefulWidget {
  final int image;
  const FullScreenPhoto({super.key, required this.image});

  @override
  State<FullScreenPhoto> createState() => _FullScreenPhotoState();
}

class _FullScreenPhotoState extends State<FullScreenPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "res/s${widget.image}.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_sharp)),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'About.dart';

class AboutDetail extends StatefulWidget {
  final String text;
  final String context;
  final String image;
  final Color color;
  const AboutDetail(
      {super.key,
      required this.text,
      required this.image,
      required this.color,
      required this.context});

  @override
  State<AboutDetail> createState() => _AboutDetailState();
}

class _AboutDetailState extends State<AboutDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: AboutBlock(
            text: widget.text,
            image: widget.image,
            color: widget.color,
            context: widget.context,
          ),
        ),
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/widgets/spaces.dart';

import '../../widgets/text_widget.dart';

class NewsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const NewsCard({super.key, required this.imagePath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ]),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontWeight: FontWeight.bold,
                  textSize: 14,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(10),
                TextWidget(
                  text: description,
                  textSize: 12,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

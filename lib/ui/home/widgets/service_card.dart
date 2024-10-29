import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/text_widget.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;

  const ServiceCard({super.key, required this.imagePath, required this.title, this.width, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: width ?? 40.w,
            height: height,
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
              child: TextWidget(text: title,
                fontWeight: FontWeight.bold,
                textSize: 14,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

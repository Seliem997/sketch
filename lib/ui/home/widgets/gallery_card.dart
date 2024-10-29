import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GalleryCard extends StatelessWidget {
  final String imagePath;

  const GalleryCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

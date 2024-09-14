import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_container.dart';
import '../../widgets/text_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.label,
    required this.imagePath,
  });

  final String label;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imagePath,),

        ),
        const SizedBox(height: 10),
        CustomSizedBox(
          width: 23.w,
          child: TextWidget(
            text: label,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

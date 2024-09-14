import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/widgets/text_widget.dart';

import '../../widgets/custom_container.dart';
import '../../widgets/navigate.dart';
import '../../widgets/spaces.dart';
import '../video_ex.dart';

class ReelsItems extends StatelessWidget {
  const ReelsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSizedBox(
          height: 355,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Column(
              children: [
                CustomContainer(
                  height: 350,
                  width: 215,
                  image: const DecorationImage(image: AssetImage('assets/images/testImg.png',),
                      fit: BoxFit.cover),
                  onTap: (){
                    navigateTo(context, const VideoApp());
                  },
                )
              ],
            ),
            separatorBuilder: (context, index) => horizontalSpace(24),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}

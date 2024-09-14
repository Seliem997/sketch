import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/styles/colors.dart';
import '../../widgets/spaces.dart';
import '../../../models/onboarding_item_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.model,
  });

  final OnBoardingItemsModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/b.png',fit: BoxFit.fitWidth,width: 100.w,),
        Column(
          children: [
            verticalSpace(400),
            Text(
              model.textTitle,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            // verticalSpace(2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                model.textBody,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.white,fontWeight: FontWeight.w400,),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

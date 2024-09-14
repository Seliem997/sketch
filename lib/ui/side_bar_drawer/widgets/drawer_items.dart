import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/spaces.dart';
import '../../widgets/text_widget.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer(
      {Key? key,
      required this.itemName,
        required this.onTap,
        required this.iconWidget})
      : super(key: key);

  final String itemName;
  final GestureTapCallback onTap;
  final Widget iconWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          iconWidget,
          horizontalSpace(5),
          TextWidget(
            text: itemName,
            color: Colors.black,
            textSize: 20,
          ),
        ],
      ),
    );
  }
}

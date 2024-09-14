import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.textSize = 16,
    this.maxLines = 10,
    this.height = 1.0,
    this.fontWeight = FontWeight.w400,
    this.isTitle = false,
    this.underLine = false,
    this.textAlign,
    this.width,
    this.textScaler,
  });
  final String text;
  final Color color;
  final double textSize;
  final double height;
  final double? width;
  final TextScaler? textScaler;
  final bool isTitle;
  final bool underLine;
  final int maxLines;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        textScaler: textScaler,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: underLine ? TextDecoration.underline : null,
          fontSize: textSize,
          color: color,
          height: height,
          overflow: TextOverflow.ellipsis,
          fontFamily:  Intl.getCurrentLocale() == 'en' ? 'NetGilroy' : 'MMTSDR',
          fontWeight: isTitle ? FontWeight.w500 : fontWeight,
          letterSpacing: Intl.getCurrentLocale() == 'en'
              ?  0.8 : 0,
        ),
      ),
    );
  }
}

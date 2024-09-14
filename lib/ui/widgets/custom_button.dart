import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/widgets/spaces.dart';
import 'package:sketch/ui/widgets/text_widget.dart';

import '../../main.dart';
import '../../utils/styles/colors.dart';


class DefaultButtonWithIcon extends StatelessWidget {
  const DefaultButtonWithIcon({
    super.key,
    this.width,
    this.height,
    this.elevation,
    this.labelSize,
    this.textColor,
    this.backgroundButton,
    this.borderRadius,
    required this.icon,
    required this.onPressed,
    required this.labelText,
    this.padding,
    this.border = false,
    this.borderColor,
  });

  final double? width, height, elevation, labelSize;
  final Color? textColor, backgroundButton, borderColor;
  final BorderRadiusGeometry? borderRadius;
  final bool border;
  final VoidCallback onPressed;
  final String labelText;
  final Widget icon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? (width! / screenWidth) * 100.w : null,
      height: height != null
          ? (height! / screenHeight) * 100.h // deduct safe area space
          : null,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          labelText,
          style:
              TextStyle(color: MyApp.themeMode(context) ? Colors.white : null),
        ),
        icon: icon,
        style: ElevatedButton.styleFrom(
            alignment: Intl.getCurrentLocale() == 'en' ? Alignment.centerLeft : Alignment.centerRight,
            foregroundColor: textColor ?? Colors.white,
            backgroundColor: backgroundButton ?? Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
                side: border
                    ? BorderSide(
                        width: 1, // the thickness
                        color: borderColor ??
                            Colors.black // the color of the border
                        )
                    : BorderSide.none),
            padding: padding ?? EdgeInsets.symmetric(horizontal: 1.w),
            textStyle: TextStyle(fontSize: labelSize)),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.borderColor,
    this.elevation = 2,
    this.fontSize = 12,
    this.enabled = true,
    this.border = false,
    this.padding,
    this.radiusCircular,
    this.fontWeight = FontWeight.w400,
  });
  final double? width, height, elevation, fontSize, radiusCircular;
  final Color? backgroundColor, textColor, borderColor;
  final String text;
  final VoidCallback onPressed;
  final bool border;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? (width! / screenWidth) * 100.w : null,
      height: height != null
          ? (height! / screenHeight) * 100.h // deduct safe area space
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor ?? AppColor.primary,
            disabledBackgroundColor: backgroundColor ?? AppColor.primary,
            elevation: elevation,
            shape: RoundedRectangleBorder(
                side: border
                    ? BorderSide(color: borderColor ?? Colors.grey, width: .5)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(radiusCircular ?? 5))),
        onPressed: enabled ? onPressed : null,
        child: TextWidget(
          text: text,
          fontWeight: fontWeight,
          color: textColor!,
          textSize: fontSize!,
        ),
      ),
    );
  }
}

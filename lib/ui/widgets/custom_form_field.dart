import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/widgets/spaces.dart';

import '../../utils/styles/colors.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    this.controller,
    this.height = 40,
    this.keyboardType,
    this.onChanged,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.suffixIcon,
    this.enabled = true,
    this.filled = false,
    this.withBorder = true,
    this.fillColor,
    this.textColor,
    this.padding,
    this.letterSpacing,
    this.textHeight,
    this.textInputAction,
    this.hintStyle,
    this.textAlign = TextAlign.start,
    this.inputFormatters = const [],
    this.radiusCircular = 5,
    this.textSize,
    this.fontWeight, this.maxLines, this.wordSpacing,
  });

  final TextEditingController? controller;
  final double? textSize;
  final double height;
  final double radiusCircular;
  final double? letterSpacing, wordSpacing;
  final double? textHeight;
  final dynamic  maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final bool isPassword, filled;
  final bool enabled;
  final bool withBorder;
  final Color? fillColor, textColor;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (height / screenHeight) * 100.h,
      decoration: BoxDecoration(
          color: enabled
              ? filled
                  ? fillColor
                  : null
              : Colors.grey[300],
          border: withBorder
              ? Border.all(
                  width: 1, color: filled ? fillColor! : Colors.red)
              : null,
          borderRadius: BorderRadius.circular(radiusCircular)),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        enabled: enabled,
        onChanged: onChanged,
        validator: validator,
        obscureText: isPassword,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: textHeight),
        textInputAction: textInputAction,
        textAlign: textAlign,
        decoration: InputDecoration(
          contentPadding: padding,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          filled: filled,
          fillColor: fillColor,
          disabledBorder: InputBorder.none,
          hintStyle: hintStyle ?? TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}

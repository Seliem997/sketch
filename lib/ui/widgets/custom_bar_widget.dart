
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/widgets/text_widget.dart';

import '../../main.dart';
import '../../utils/styles/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final bool withArrow;
  final Color? backgroundColor, backgroundColorDark;
  final Widget customizePopButton;
  final GestureTapCallback? onTap;
  final VoidCallback? onArrowPressed;

  const CustomAppBar({
    super.key,
    this.withArrow = true,
    this.customizePopButton = const SizedBox(),
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.backgroundColorDark,
    this.onArrowPressed,
  })  : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(
        text: title,
        color: Colors.white,
        textSize: 18,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: backgroundColor ?? (AppColor.primary),
      leading: withArrow
          ? IconButton(
              icon: /*SvgPicture.asset(
                Intl.getCurrentLocale() == 'en' ? 'assets/svg/arrow-left.svg' : 'assets/svg/arrow-right.svg',
                colorFilter: ColorFilter.mode(MyApp.themeMode(context) ? Colors.white : Colors.black, BlendMode.color),
                width: 5.w,
              )*/const Icon(Icons.connecting_airports_sharp),
              onPressed: onArrowPressed ?? () => Navigator.pop(context),
              color: Colors.black,
              iconSize: 20.0,
            )
          : customizePopButton,
      centerTitle: true,
      titleSpacing: 0,
      elevation: 0,
/*
      actions: [
        Padding(
          padding: onlyEdgeInsets(end: 24),
          child: CustomContainer(
              backgroundColor: Colors.transparent,
              borderColorDark: Colors.transparent,
              height: 26,
              width: 26,
              onTap: onTap ??
                  () {
                    navigateAndFinish(context, const HomeScreen());
                  },
              child: Image.asset(
                'assets/images/home_icon.png',
                color: MyApp.themeMode(context) ? Colors.white : Colors.black,
              )),
        ),
      ],
*/
    );
  }
}

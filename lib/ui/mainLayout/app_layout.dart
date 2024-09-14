
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/app_provider.dart';
import '../../utils/styles/colors.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key,});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((value) => loadData());
    super.initState();
  }

  void loadData() async {}

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            body: Stack(
              children: [
                provider.bottomScreens[provider.currentIndex],
                Column(
                  children: [
                    const Spacer(),
                    CircleNavBar(
                      activeIcons: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/svg/home.svg', color: Colors.white, ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/svg/chat.svg', color: Colors.white, fit: BoxFit.contain,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/svg/reels.svg', color: Colors.white, fit: BoxFit.contain,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/svg/gallery.svg', color: Colors.white, fit: BoxFit.contain,),
                        ),
                      ],
                      inactiveIcons: [
                        SvgPicture.asset('assets/svg/home.svg'),
                        SvgPicture.asset('assets/svg/chat.svg'),
                        SvgPicture.asset('assets/svg/reels.svg'),
                        SvgPicture.asset('assets/svg/gallery.svg'),
                      ],
                      levels: [
                        "Home",
                        "Chat",
                        "Reels",
                        "Gallery",
                      ],
                      activeLevelsStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                      inactiveLevelsStyle: const TextStyle(
                          color: Color(0xFF9DB2CE)
                      ),
                      color: Colors.red,
                      circleColor: Colors.red,
                      height: 75,
                      circleWidth: 60,
                      onTap: (v) {
                        provider.changeBottom(v);
                      },
                      // tabCurve: ,
                      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                      cornerRadius: const BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                      shadowColor: Colors.white24,
                      circleShadowColor: Colors.white70,
                      elevation: 10,
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [ AppColor.primary, AppColor.primary ],
                      ),
                      circleGradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [ AppColor.primary, AppColor.primary ],
                      ),
                      activeIndex: provider.currentIndex,
                    ),
                  ],
                ),

              ],
            ),
          /*bottomNavigationBar:  AnimatedNotchBottomBar(
            notchBottomBarController: notchBottomBarController,
          bottomBarItems: [
        const BottomBarItem(
        inActiveItem: Icon(
        Icons.home_filled,
          color: Colors.blueGrey,
        ),
        activeItem: Icon(
        Icons.home_filled,
        color: Colors.blueAccent,
        ),
        itemLabel: 'Page 1',
        ),
        const BottomBarItem(
        inActiveItem: Icon(
        Icons.star,
        color: Colors.blueGrey,
        ),
        activeItem: Icon(
        Icons.star,
        color: Colors.blueAccent,
        ),
        itemLabel: 'Page 2',
        ),

        ///svg item
        BottomBarItem(
        inActiveItem: SvgPicture.asset(
        'assets/search_icon.svg',
        color: Colors.blueGrey,
        ),
        activeItem: SvgPicture.asset(
        'assets/search_icon.svg',
        color: Colors.black,
        ),
        itemLabel: 'Page 3',
        ),
        ],
            onTap: (int value) {  }, kIconSize: 12, kBottomRadius: 10,
        ),*/
        );
      },
    );
  }
}

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/side_bar_drawer/widgets/drawer_items.dart';

import '../../generated/l10n.dart';
import '../../providers/app_provider.dart';
import '../../utils/cache_helper.dart';
import '../../utils/enum/shared_preference_keys.dart';

import '../../utils/styles/colors.dart';
import '../widgets/text_widget.dart';
import '../widgets/spaces.dart';

class SideBarDrawerView extends StatelessWidget {
  const SideBarDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<AppProvider>(builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            actions: [
              GestureDetector(
                onTap: () {
                  provider.changeSideBarDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: SvgPicture.asset(
                    'assets/svg/close.svg',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //هنا ال column الكبير المحتضن الكل
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  //هنا بقي العمود الصغير المحتوي علي الصورة والاسم
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    TextWidget(
                      text: CacheHelper.returnData(key: CacheKey.userName) ??
                          'welcome Sketch',
                      isTitle: true,
                      textSize: 25,
                      color: Colors.black,
                    ),
                  ],
                ),
                verticalSpace(40),
                Column(
                  children: [
                    ItemDrawer(
                      iconWidget: SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      itemName: 'Profile',
                      onTap: () {
                        provider.changeSideBarDrawer();
                      },
                    ),
                    verticalSpace(25),
                    ItemDrawer(
                      iconWidget: SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      itemName: 'About',
                      onTap: () {
                        provider.changeSideBarDrawer();
                      },
                    ),
                    verticalSpace(25),
                    ItemDrawer(
                      iconWidget: SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      itemName:
                          'Gallery',
                      onTap: () {

                        provider.changeSideBarDrawer();
                      },
                    ),
                    verticalSpace(25),
                    ItemDrawer(
                      iconWidget: SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      itemName: 'Services',
                      onTap: () {
                        provider.changeSideBarDrawer();
                      },
                    ),
                    verticalSpace(25),
                    ItemDrawer(
                      iconWidget: SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      itemName: 'Contact Us',
                      onTap: () {
                      },
                    ),
                    verticalSpace(25),
                    ItemDrawer(
                      iconWidget: SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      itemName: 'logout',
                      onTap: () {
                        provider.changeSideBarDrawer();
                        provider.changeBottom(0);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

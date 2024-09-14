import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/home/video_ex.dart';
import 'package:sketch/ui/home/widgets/categories.dart';
import 'package:sketch/ui/home/widgets/reels_widget.dart';
import 'package:sketch/ui/side_bar_drawer/side_bar_view.dart';
import 'package:sketch/ui/widgets/custom_container.dart';
import 'package:sketch/ui/widgets/navigate.dart';
import 'package:sketch/ui/widgets/spaces.dart';
import 'package:sketch/ui/widgets/text_widget.dart';
import 'package:sketch/utils/font_styles.dart';

import '../../providers/home_provider.dart';
import '../widgets/custom_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider =
    Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar:  AppBar(
        title: Text('Sketch'),
      ),
      drawer: const SideBarDrawerView(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15),
              ReelsItems(),
            ],
          ),
        ),
      ),
    );
  }
}



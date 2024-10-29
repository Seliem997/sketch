import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketch/ui/reels/reels_widget.dart';
import 'package:sketch/ui/side_bar_drawer/side_bar_view.dart';
import 'package:sketch/ui/widgets/spaces.dart';

import '../../providers/home_provider.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar:  AppBar(
        title: Text('Reels'),
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



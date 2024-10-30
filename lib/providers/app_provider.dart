import 'package:flutter/material.dart';
import 'package:sketch/ui/reels/reels_screen.dart';

import '../ui/chat/chat_screen.dart';
import '../ui/gallery/gallery_screen.dart';
import '../ui/home/home_screen.dart';

class AppProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomePage(),
    const ChatScreen(),
    ReelsScreen(),
    const GalleryScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    notifyListeners();
  }

//-------------------------------------------- changeSideBarDrawer -------

  bool isDrawerOpen = false;

  void changeSideBarDrawer() {
    if (isDrawerOpen) {
      isDrawerOpen = false;
      notifyListeners();
    } else {
      isDrawerOpen = true;
      notifyListeners();
    }
  }
}

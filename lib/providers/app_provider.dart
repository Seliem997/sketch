
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ui/home/home.dart';
import '../ui/home/home_screen.dart';
import '../ui/onboarding/onboarding_screen.dart';
import '../ui/user/register/register.dart';

class AppProvider extends ChangeNotifier {

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomePage(),
    const OnboardingScreen(),
    const HomePage(),
    const OnboardingScreen(),
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
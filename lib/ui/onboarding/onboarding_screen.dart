import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/onboarding/widgets/boarding_items_list.dart';
import 'package:sketch/ui/onboarding/widgets/page_view_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main.dart';
import '../../utils/cache_helper.dart';
import '../../utils/enum/shared_preference_keys.dart';
import '../../utils/styles/colors.dart';
import '../user/register/register.dart';
import '../widgets/navigate.dart';
import '../widgets/spaces.dart';
import '../widgets/text_widget.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isLast = false;
  bool _firstPage = true;

  void submit() {
    CacheHelper.saveData(key: CacheKey.showOnBoarding, value: true)
        .then((value) {
      if (value) {
        navigateAndFinish(context, const RegisterPhoneNumber());
      }
    });
  }

  @override
  void dispose() {
    CacheHelper.saveData(key: CacheKey.showOnBoarding, value: true);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var boardController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: boardController,
            itemBuilder: (context, index) =>
                PageViewItem(model: boardingItemsList[index]),
            itemCount: boardingItemsList.length,
            onPageChanged: (int index) {
              if (index == boardingItemsList.length - 1) {
                setState(() {
                  _isLast = true;
                });
              } else {
                setState(() {
                  _isLast = false;
                });
              }
              if (index == 0) {
                setState(() {
                  _firstPage = true;
                });
              } else {
                setState(() {
                  _firstPage = false;
                });
              }
            },
          ),
          Positioned(
            top: 6.h,
            child: Container(
              width: 90.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Intl.getCurrentLocale() == 'ar') {
                        MyApp.setLocale(context, const Locale("en"));
                      } else {
                        MyApp.setLocale(context, const Locale("ar"));
                      }
                      setState(() {});
                    },
                    child: Text(
                      Intl.getCurrentLocale() == 'en' ? "ع" : 'EN',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isLast ? false : true,
                    child: GestureDetector(
                      onTap: () {
                        submit();
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 42.w,
            child: SmoothPageIndicator(
              controller: boardController,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColor.primary,
                dotColor: Colors.white,
                dotHeight: 8,
                dotWidth: 7,
                expansionFactor: 4,
                spacing: 2.w,
              ),
            ),
          ),
          Positioned(
            bottom: 2.h,
            child: Container(
              width: 90.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _firstPage ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          boardController.previousPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Intl.getCurrentLocale() == "en"
                                  ? 'assets/svg/arrow-left.svg'
                                  : 'assets/svg/arrow-right.svg',
                              height: 20,
                            ),
                            horizontalSpace(2),
                            TextWidget(
                              text: "previous",
                              color: Colors.white,
                              textSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _isLast
                      ? TextButton(
                      onPressed: () {
                        submit();
                      },
                      child: TextWidget(
                        text: "getStarted",
                        color: AppColor.primary,
                        isTitle: true,
                        textSize: 17.sp,
                      ))
                      : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: Row(
                        children: [
                          TextWidget(
                            text: "next",
                            color: AppColor.primary,
                            textSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          horizontalSpace(2),
                          SvgPicture.asset(
                            Intl.getCurrentLocale() == "en"
                                ? 'assets/svg/arrow-right.svg'
                                : 'assets/svg/arrow-left.svg',
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/home/widgets/categories.dart';
import 'package:sketch/ui/home/widgets/news_card.dart';
import 'package:sketch/ui/reels/reels_widget.dart';
import 'package:sketch/ui/user/profile/profile_screen.dart';
import 'package:sketch/ui/widgets/navigate.dart';
import 'package:sketch/ui/widgets/spaces.dart';
import 'package:sketch/ui/widgets/text_widget.dart';

import 'widgets/gallery_card.dart';
import 'widgets/service_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: symmetricEdgeInsets(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: symmetricEdgeInsets(horizontal: 20),
                  children: [
                    verticalSpace(20),
                    Row(
                      children: [
                        Expanded(child: TextWidget(text: 'We Create Lifestyle', fontWeight: FontWeight.w600,textSize: 18.sp,)),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset('assets/svg/language.svg'),
                        ),
                        horizontalSpace(18),
                        GestureDetector(
                          onTap: (){
                            navigateTo(context, const ProfileScreen());
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage('assets/images/img.png'), // Replace with your image path
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    // Categories
                    SizedBox(
                      height: 20.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const CategoryItem( label: 'Commercial complexes',
                            imagePath: 'assets/images/testImg.png',);
                        },
                        separatorBuilder: (context, index) => horizontalSpace(10),
                      ),
                    ),
                    // Reels
                    const Text(
                      'Reels',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(10),
                    // Reels content
                    const ReelsItems(),
                    verticalSpace(10),
                    // News
                    const SizedBox(height: 32),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 25.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => const NewsCard(
                            imagePath: 'assets/images/testImg.png',
                            title: 'Modern Villa Design',
                            description: 'The architectural design is a stable and centralised composition consisting of a number of spaces that gather around a dominant idea',
                          ), separatorBuilder: (context, index)=> horizontalSpace(10), itemCount: 5),
                    ),
                    const SizedBox(height: 20),
                      const Text(
                        'Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 20.h,
                       child: ListView.separated(
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) => const GalleryCard(imagePath: 'assets/images/testImg.png'),
                           separatorBuilder: (context, index)=> horizontalSpace(10),
                           itemCount: 5,
                       ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 20.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => const ServiceCard(
                          imagePath: 'assets/images/testImg.png',
                          title: 'Architectural Design',
                        ), separatorBuilder: (context, index)=> horizontalSpace(10), itemCount: 5),
                      ),
                    verticalSpace(15.h)

                    // Add news content here
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  // Helper to build reel items
  Widget buildReelItem(BuildContext context, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {
            // Add your share logic here
          },
        ),
      ),
    );
  }
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/home/widgets/categories.dart';
import 'package:sketch/ui/home/widgets/reels_widget.dart';
import 'package:sketch/ui/widgets/spaces.dart';
import 'package:sketch/ui/widgets/text_widget.dart';


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
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('assets/images/img.png'), // Replace with your image path
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
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                      Text(
                        'Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 20.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageContainer(imagePath: 'assets/images/testImg.png'),
                            SizedBox(width: 8),
                            ImageContainer(imagePath: 'assets/images/testImg.png'),
                            SizedBox(height: 8),
                            ImageContainer(imagePath: 'assets/images/testImg.png'),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 20.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ServiceCard(
                          imagePath: 'assets/images/testImg.png',
                          title: 'Architectural Design',
                        ), separatorBuilder: (context, index)=> horizontalSpace(5), itemCount: 5),
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

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ServiceCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
            ),
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

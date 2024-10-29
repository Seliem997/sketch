import 'package:flutter/material.dart';
import 'package:sketch/ui/gallery/gallery_details.dart';
import 'package:sketch/ui/widgets/custom_bar_widget.dart';
import 'package:sketch/ui/widgets/navigate.dart';

import '../home/widgets/service_card.dart';
import '../widgets/spaces.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> categories = ["All", "Internal Design", "Architecture Design"];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Gallery', withArrow: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                            color: selectedCategoryIndex == index ? Colors.white : Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        if (selectedCategoryIndex == index)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 24,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            // Grid of Images
            Expanded(
              child: GridView.builder(
                itemCount: 8, // Adjust based on the number of items
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return ServiceCard(
                    width: double.infinity,
                    imagePath: 'assets/images/testImg.png',
                    title: 'Modern Villa Design',
                    onTap: (){
                      navigateTo(context, GalleryDetails());
                    },
                  )
                  /*Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image with rounded corners
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'assets/images/testImg.png', // Replace with actual image paths
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Image title
                      Text(
                        'Modern Villa Design',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )*/;
                },
              ),
            ),
            verticalSpace(70),

          ],
        ),
      ),
    );
  }
}

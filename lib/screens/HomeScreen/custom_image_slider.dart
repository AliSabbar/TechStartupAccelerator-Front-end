import 'package:flutter/material.dart';

import '../../data/images.dart';

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: sliderImages.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 15,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 350, child: Image.asset(sliderImages[index]));
        },
      ),
    );
  }
}

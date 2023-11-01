import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/common/styles/app_fonts.dart';
import 'package:weather_app/common/styles/app_shapes.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';

class TallInfoBox extends StatelessWidget {
  const TallInfoBox(
      {super.key,
      required this.imagePath,
      required this.iconPath,
      required this.title,
      required this.value,
      required this.index});

  final String imagePath;
  final String iconPath;
  final String title;
  final String value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      height: 220,
      decoration: ShapeDecoration(
        color: AppColors.grey,
        shape: AppShapes.smoothRectangle(),
        image: DecorationImage(
          image: AssetImage(imagePath),
          scale: 1.5,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconWithTitle(iconPath: iconPath, title: title),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  value,
                  textAlign: TextAlign.end,
                  style: AppFonts.header(fontSize: 40),
                ),
              ],
            )
          ]),
    ).animate(delay: (150 * index).ms).fadeIn(duration: 600.ms);
  }
}

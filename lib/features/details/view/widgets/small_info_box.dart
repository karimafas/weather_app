import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/common/styles/app_fonts.dart';
import 'package:weather_app/common/styles/app_shapes.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';

class SmallInfoBox extends StatelessWidget {
  const SmallInfoBox(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.value,
      required this.index});

  final String iconPath;
  final String title;
  final String value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 8),
      decoration: ShapeDecoration(
        shape: AppShapes.smoothRectangle(),
        color: AppColors.medium,
      ),
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconWithTitle(iconPath: iconPath, title: title),
            Text(
              value,
              style: AppFonts.header(fontSize: 40),
            )
          ]),
    ).animate(delay: (150 * index).ms).fadeIn(duration: 600.ms);
  }
}

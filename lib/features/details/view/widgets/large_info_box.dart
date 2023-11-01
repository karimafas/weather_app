import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/common/styles/app_fonts.dart';
import 'package:weather_app/common/styles/app_shapes.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';

class LargeInfoBox extends StatelessWidget {
  const LargeInfoBox(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.entries,
      required this.index});

  final String iconPath;
  final String title;
  final List<(String, String)> entries;
  // Starts from 1, and it represents the multiplier that determines the fade in delay for the widget.
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        shape: AppShapes.smoothRectangle(),
        color: AppColors.grey,
      ),
      width: double.infinity,
      child: Column(children: <Widget>[
        IconWithTitle(iconPath: iconPath, title: title),
        ...entries.map(((String, String) entry) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      entry.$1,
                      style: AppFonts.body(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      entry.$2,
                      style: AppFonts.body(),
                    ),
                  ]),
            ))
      ]),
    ).animate(delay: (150 * index).ms).fadeIn(duration: 600.ms);
  }
}

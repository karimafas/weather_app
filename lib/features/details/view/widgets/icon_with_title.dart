import 'package:flutter/material.dart';
import 'package:weather_app/common/styles/app_fonts.dart';

class IconWithTitle extends StatelessWidget {
  const IconWithTitle({super.key, required this.iconPath, required this.title});

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image.asset(iconPath, height: 20, color: Colors.white.withOpacity(0.45)),
      const SizedBox(width: 5),
      Flexible(
        child: Text(
          title.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.body(
              fontWeight: FontWeight.bold,
              fontSize: 11.5,
              color: Colors.white.withOpacity(0.45)),
        ),
      )
    ]);
  }
}

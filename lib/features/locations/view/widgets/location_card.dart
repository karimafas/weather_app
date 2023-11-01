import 'package:flutter/material.dart';
import 'package:weather_app/common/extensions/double.dart';
import 'package:weather_app/common/hero/hero_tags.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/common/styles/app_fonts.dart';
import 'package:weather_app/common/styles/app_shapes.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.city,
    required this.country,
    required this.temperature,
    required this.onTap,
  });

  final String city;
  final String country;
  final double temperature;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${HeroTags.header}_$city',
      child: Material(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 100,
            decoration: ShapeDecoration(
                shape: AppShapes.smoothRectangle(), color: AppColors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.header(),
                      ),
                      Text(
                        country,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.body(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    temperature.formatTemperature(),
                    style: AppFonts.header(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

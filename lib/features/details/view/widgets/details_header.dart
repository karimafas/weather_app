import 'package:flutter/material.dart';
import 'package:weather_app/common/extensions/double.dart';
import 'package:weather_app/common/hero/hero_tags.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/common/styles/app_fonts.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader(
      {super.key,
      required this.city,
      required this.country,
      required this.temperature,
      required this.descriptions});

  final String city;
  final String country;
  final double temperature;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${HeroTags.header}_$city',
      child: Material(
        child: Container(
          width: double.infinity,
          color: AppColors.grey,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SafeArea(
                  bottom: false,
                  child: Text(
                    city,
                    style: AppFonts.header(),
                  ),
                ),
                Text(
                  country,
                  style: AppFonts.body(),
                ),
                Text(
                  temperature.formatTemperature(),
                  style: AppFonts.header(fontSize: 40),
                ),
                if (descriptions.isNotEmpty)
                  Text(
                    descriptions.first,
                    style: AppFonts.body(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

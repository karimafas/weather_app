import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/common/extensions/double.dart';
import 'package:weather_app/common/styles/app_images.dart';
import 'package:weather_app/features/details/view/widgets/details_header.dart';
import 'package:weather_app/features/details/view/widgets/large_info_box.dart';
import 'package:weather_app/features/details/view/widgets/small_info_box.dart';
import 'package:weather_app/features/details/view/widgets/tall_info_box.dart';
import 'package:weather_repository/weather_repository.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.forecast});

  final ForecastResponse forecast;

  CurrentForecast get current => forecast.current;
  ForecastLocation get location => forecast.location;

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            ListView(
                padding: const EdgeInsets.only(bottom: 50),
                children: <Widget>[
                  DetailsHeader(
                    city: location.name,
                    country: location.country,
                    temperature: current.temperature,
                    descriptions: current.weatherDescriptions,
                  ),
                  const SizedBox(height: 25),
                  LargeInfoBox(
                      index: 1,
                      iconPath: AppImages.wind.path,
                      title: 'details.wind'.tr(),
                      entries: <(String, String)>[
                        (
                          'details.speed'.tr(),
                          '${current.windSpeed.toStringAsFixed(0)} km/h'
                        ),
                        (
                          'details.degree'.tr(),
                          current.windDegree.toStringAsFixed(0)
                        ),
                        ('details.direction'.tr(), current.windDirection),
                      ]),
                  const SizedBox(height: 25),
                  LargeInfoBox(
                      index: 2,
                      iconPath: AppImages.conditions.path,
                      title: 'details.conditions'.tr(),
                      entries: <(String, String)>[
                        (
                          'details.pressure'.tr(),
                          '${current.pressure.toStringAsFixed(0)} MB'
                        ),
                        (
                          'details.precipitation'.tr(),
                          '${current.precipitation} mm'
                        ),
                        (
                          'details.humidity'.tr(),
                          '${current.humidity.toStringAsFixed(0)}%'
                        ),
                        (
                          'details.visibility'.tr(),
                          '${current.visibility.toStringAsFixed(0)} km'
                        ),
                      ]),
                  const SizedBox(height: 25),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TallInfoBox(
                          index: 3,
                          imagePath: AppImages.cloud.path,
                          iconPath: AppImages.clouds.path,
                          title: 'details.cloud_cover'.tr(),
                          value: '${current.cloudCover.toStringAsFixed(0)}%',
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          SmallInfoBox(
                            iconPath: AppImages.thermometer.path,
                            title: 'details.feels_like'.tr(),
                            value: current.feelsLike.formatTemperature(),
                            index: 4,
                          ),
                          const SizedBox(height: 25),
                          SmallInfoBox(
                            iconPath: AppImages.thermometer.path,
                            title: 'details.uv_index'.tr(),
                            value: current.uvIndex.toStringAsFixed(0),
                            index: 5,
                          ),
                        ],
                      ))
                    ],
                  ),
                ]),
            SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: BackButton(
                    color: secondaryColor,
                    onPressed: () => context.popRoute(),
                  ),
                )).animate(delay: 500.ms).fadeIn()
          ],
        ),
      ),
    );
  }
}

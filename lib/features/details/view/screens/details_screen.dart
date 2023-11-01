import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/details/view/widgets/details_header.dart';
import 'package:weather_repository/weather_repository.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.forecast});

  final ForecastResponse forecast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SizedBox.expand(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DetailsHeader(
              city: forecast.location.name,
              country: forecast.location.country,
              temperature: forecast.current.temperature,
              descriptions: forecast.current.weatherDescriptions,
            )
          ]),
        ),
      ),
    );
  }
}

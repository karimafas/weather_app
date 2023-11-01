import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/router/app_router.dart';
import 'package:weather_app/common/styles/app_fonts.dart';
import 'package:weather_app/features/locations/view/screens/test_response.dart';
import 'package:weather_app/features/locations/view/widgets/location_card.dart';
import 'package:weather_repository/weather_repository.dart';

@RoutePage()
class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<ForecastResponse> locations = <ForecastResponse>[
      ForecastResponse.fromJson(testWeatherResponse)
    ];

    return Scaffold(
        body: SizedBox.expand(
      child: ListView(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  DateFormat('EEEE').format(now),
                  textAlign: TextAlign.center,
                  style: AppFonts.header(),
                ),
                Text(
                  '${DateFormat('d').format(now)} ${DateFormat('MMMM').format(now)} ${DateFormat('yyyy').format(now)}',
                  textAlign: TextAlign.center,
                  style: AppFonts.body(),
                ),
              ],
            ),
          ),
          ...locations.map(
            (ForecastResponse response) => LocationCard(
              onTap: () {
                HapticFeedback.lightImpact();
                context.pushRoute(DetailsRoute(forecast: response));
              },
              city: response.location.name,
              country: response.location.country,
              temperature: response.current.temperature,
            ),
          )
        ],
      ),
    ));
  }
}

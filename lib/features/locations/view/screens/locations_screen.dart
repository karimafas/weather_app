import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/router/app_router.dart';
import 'package:weather_app/common/services/service_locator.dart';
import 'package:weather_app/common/styles/app_fonts.dart';
import 'package:weather_app/common/widgets/error_alert.dart';
import 'package:weather_app/features/locations/bloc/locations_bloc.dart';
import 'package:weather_app/features/locations/view/widgets/color_button.dart';
import 'package:weather_app/features/locations/view/widgets/location_card.dart';
import 'package:weather_repository/weather_repository.dart';

@RoutePage()
class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationsBloc>(
      create: (_) => LocationsBloc(
          weatherRepository: ServiceLocator.instance.get<WeatherRepository>()),
      child: const LocationsView(),
    );
  }
}

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return BlocBuilder<LocationsBloc, LocationsState>(
        builder: (BuildContext context, LocationsState state) {
      final Color secondaryColor = Theme.of(context).colorScheme.secondary;
      return Scaffold(
          floatingActionButton: const ColorButton(),
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
                        style: AppFonts.header(
                          color: secondaryColor,
                        ),
                      ),
                      Text(
                        '${DateFormat('d').format(now)} ${DateFormat('MMMM').format(now)} ${DateFormat('yyyy').format(now)}',
                        textAlign: TextAlign.center,
                        style: AppFonts.body(
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is LocationsLoading) ...<Widget>[
                  const SizedBox(height: 100),
                  Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary),
                  )
                ] else if (state is LocationsError) ...<Widget>[
                  const SizedBox(height: 50),
                  Center(
                    child: ErrorAlert(text: 'locations.error'.tr()),
                  )
                ] else if (state is LocationsSuccess)
                  ...state.result.mapIndexed(
                    (int index, ForecastResponse response) => LocationCard(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.pushRoute(DetailsRoute(forecast: response));
                      },
                      city: response.location.name,
                      country: response.location.country,
                      temperature: response.current.temperature,
                    ).animate(delay: (index * 150).ms).fadeIn(),
                  )
              ],
            ),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    _loadLocations(context);
  }

  void _loadLocations(BuildContext context) {
    context.read<LocationsBloc>().add(const LoadInitialLocations());
  }
}

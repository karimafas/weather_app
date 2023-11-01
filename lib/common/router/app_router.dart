import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/router/screens.dart';
import 'package:weather_repository/weather_repository.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        CustomRoute(page: LocationsRoute.page, initial: true),
        CustomRoute(
          page: DetailsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 600,
        )
      ];
}

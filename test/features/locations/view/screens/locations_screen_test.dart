import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http_service/http_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/common/widgets/error_alert.dart';
import 'package:weather_app/features/locations/view/screens/locations_screen.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../../../data/common_test_data.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late MockWeatherRepository weatherRepository;

  setUpAll(() {
    weatherRepository = MockWeatherRepository();
    GetIt.I.registerSingleton<WeatherRepository>(weatherRepository);
  });

  group('$LocationsScreen', () {
    final DateTime now = DateTime.now();

    testWidgets(
        'it should render CircularProgressIndicator if bloc state is LocationsLoading',
        (WidgetTester widgetTester) async {
      await widgetTester.runAsync(() async {
        when(() => weatherRepository.getCurrentForecast(any())).thenAnswer(
            (_) async => ApiSuccess<ForecastResponse>(testForecastResponse));
        await widgetTester.pumpWidget(await buildLocalisedWidget(
            child: const TestHelperWidget(child: LocationsScreen())));
        await widgetTester.pump(const Duration(milliseconds: 500));

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    testWidgets(
        'it should render the widget correctly when bloc emits LocationsSuccess',
        (WidgetTester widgetTester) async {
      await widgetTester.runAsync(() async {
        when(() => weatherRepository.getCurrentForecast(any())).thenAnswer(
            (_) async => ApiError<ForecastResponse>(testForecastResponse));
        await widgetTester.pumpWidget(await buildLocalisedWidget(
            child: const TestHelperWidget(child: LocationsScreen())));
        await widgetTester.pumpAndSettle(const Duration(seconds: 5));

        expect(find.text(DateFormat('EEEE').format(now)), findsOneWidget);
        final String serialisedDate =
            '${DateFormat('d').format(now)} ${DateFormat('MMMM').format(now)} ${DateFormat('yyyy').format(now)}';
        expect(find.text(serialisedDate), findsOneWidget);
      });
    });

    testWidgets('it should render ErrorAlert if bloc state is LocationsError',
        (WidgetTester widgetTester) async {
      await widgetTester.runAsync(() async {
        when(() => weatherRepository.getCurrentForecast(any()))
            .thenAnswer((_) async => ApiError<ForecastResponse>(Exception()));
        await widgetTester.pumpWidget(await buildLocalisedWidget(
            child: const TestHelperWidget(child: LocationsScreen())));
        await widgetTester.pumpAndSettle(const Duration(seconds: 5));

        expect(find.byType(ErrorAlert), findsOneWidget);
      });
    });
  });
}

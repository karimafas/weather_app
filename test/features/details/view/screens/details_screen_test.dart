import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/common/extensions/double.dart';
import 'package:weather_app/features/details/view/screens/details_screen.dart';
import 'package:weather_app/features/details/view/widgets/details_header.dart';
import 'package:weather_app/features/details/view/widgets/large_info_box.dart';
import 'package:weather_app/features/details/view/widgets/small_info_box.dart';
import 'package:weather_app/features/details/view/widgets/tall_info_box.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../../../data/test_weather_response.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  final ForecastResponse forecast =
      ForecastResponse.fromJson(testWeatherResponse);

  group('$DetailsScreen', () {
    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(await buildLocalisedWidget(
          child: DetailsScreen(
        forecast: forecast,
      )));
      await widgetTester.pumpAndSettle(500.ms);

      expect(find.byType(DetailsHeader), findsOneWidget);
      expect(find.byType(LargeInfoBox), findsNWidgets(2));
      expect(find.byType(TallInfoBox), findsOneWidget);
      expect(find.byType(SmallInfoBox), findsNWidgets(2));

      final LargeInfoBox firstBox =
          widgetTester.widget(find.byType(LargeInfoBox).first);
      expect(
          firstBox.entries,
          equals(<(String, String)>[
            ('Speed', '${forecast.current.windSpeed} km/h'),
            ('Degree', '${forecast.current.windDegree}'),
            ('Direction', forecast.current.windDirection),
          ]));

      final LargeInfoBox secondBox =
          widgetTester.widget(find.byType(LargeInfoBox).at(1));
      expect(
          secondBox.entries,
          equals(<(String, String)>[
            ('Pressure', '${forecast.current.pressure} MB'),
            ('Precipitation', '${forecast.current.precipitation} mm'),
            ('Humidity', '${forecast.current.humidity}%'),
            ('Visibility', '${forecast.current.visibility} km'),
          ]));

      final TallInfoBox tallBox = widgetTester.widget(find.byType(TallInfoBox));
      expect(tallBox.title, equals('cloud cover'));
      expect(tallBox.value, equals('${forecast.current.cloudCover}%'));

      final SmallInfoBox firstSmallBox =
          widgetTester.widget(find.byType(SmallInfoBox).first);
      expect(firstSmallBox.title, equals('feels like'));
      expect(firstSmallBox.value,
          equals(forecast.current.feelsLike.formatTemperature()));

      final SmallInfoBox secondSmallBox =
          widgetTester.widget(find.byType(SmallInfoBox).at(1));
      expect(secondSmallBox.title, equals('UV index'));
      expect(secondSmallBox.value, equals(forecast.current.uvIndex.toString()));
    });
  });
}

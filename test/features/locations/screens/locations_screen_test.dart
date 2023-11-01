import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/locations/view/screens/locations_screen.dart';

import '../../../utils/widget_utils.dart';

void main() {
  group('$LocationsScreen', () {
    final DateTime now = DateTime.now();
    // final List<ForecastResponse> response = <ForecastResponse>[
    //   ForecastResponse.fromJson(testWeatherResponse)
    // ];

    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester
          .pumpWidget(const TestHelperWidget(child: LocationsScreen()));

      expect(find.text(DateFormat('EEEE').format(now)), findsOneWidget);
      final String serialisedDate =
          '${DateFormat('d').format(now)} ${DateFormat('MMMM').format(now)} ${DateFormat('yyyy').format(now)}';
      expect(find.text(serialisedDate), findsOneWidget);
    });
  });
}

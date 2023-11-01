import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/locations/view/widgets/location_card.dart';

import '../../../utils/widget_utils.dart';

void main() {
  const String city = 'city';
  const String country = 'country';
  const double temperature = 12;

  group('$LocationCard', () {
    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(TestHelperWidget(
          child: LocationCard(
        city: city,
        country: country,
        temperature: temperature,
        onTap: () {},
      )));

      expect(find.byType(Hero), findsOneWidget);
      expect(find.text(city), findsOneWidget);
      expect(find.text(country), findsOneWidget);
      expect(find.text('12°C'), findsOneWidget);
    });
  });
}

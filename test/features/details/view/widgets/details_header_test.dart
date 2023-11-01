import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/details/view/widgets/details_header.dart';

import '../../../../utils/widget_utils.dart';

void main() {
  const String city = 'city';
  const String country = 'country';
  const double temperature = 12;
  const List<String> descriptions = <String>['description'];

  group('$DetailsHeader', () {
    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(const TestHelperWidget(
          child: DetailsHeader(
        city: city,
        country: country,
        descriptions: descriptions,
        temperature: temperature,
      )));

      expect(find.byType(Hero), findsOneWidget);
      expect(find.text(city), findsOneWidget);
      expect(find.text(country), findsOneWidget);
      expect(find.text('12°C'), findsOneWidget);
      expect(find.text(descriptions.first), findsOneWidget);
    });
  });
}

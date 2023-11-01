import 'package:test/test.dart';
import 'package:weather_repository/src/models/forecast_response.dart';

import 'data/test_weather_response.dart';

void main() {
  group('$ForecastResponse', () {
    test('it should deserialise JSON correctly', () {
      final ForecastResponse response = ForecastResponse.fromJson(testWeatherResponse);

      expect(response.request.type, equals('City'));
      expect(response.location.name, equals('New York'));
      expect(response.current.observationTime, equals('12:14 PM'));
    });
  });
}

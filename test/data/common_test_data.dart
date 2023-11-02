import 'package:mocktail/mocktail.dart';
import 'package:weather_repository/weather_repository.dart';

import 'test_weather_response.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

final ForecastResponse testForecastResponse =
    ForecastResponse.fromJson(testWeatherResponse);

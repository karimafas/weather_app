import 'package:http_service/http_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather_repository/weather_repository.dart';

import 'data/test_weather_response.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  group('getCurrentForecast', () {
    const String mockApiKey = 'mockApiKey';
    const String mockQuery = 'mockQuery';
    late WeatherRepository repository;
    late MockHttpService httpService;

    setUp(() {
      httpService = MockHttpService();
      repository =
          WeatherRepository(httpService: httpService, apiKey: mockApiKey);
    });

    test('should return ApiSuccess if http service returns ForecastResponse',
        () async {
      final ApiSuccess<ForecastResponse> expectedResult =
          ApiSuccess<ForecastResponse>(
              ForecastResponse.fromJson(testWeatherResponse));
      when(() => httpService.request<ForecastResponse, Map<String, dynamic>>(
          requestType: HttpRequestType.get,
          onResult: any(named: 'onResult'),
          url: any(named: 'url'))).thenAnswer((_) async => expectedResult);

      final ApiResponse<ForecastResponse> result =
          await repository.getCurrentForecast(mockQuery);

      expect(result, equals(expectedResult));
    });

    test('should return ApiError if http service returns an error', () async {
      when(() => httpService.request<ForecastResponse, Map<String, dynamic>>(
              requestType: HttpRequestType.get,
              onResult: any(named: 'onResult'),
              url: any(named: 'url')))
          .thenAnswer((_) async => ApiError<ForecastResponse>(
              Exception('There was an error when fetching data.')));

      final ApiResponse<ForecastResponse> result =
          await repository.getCurrentForecast(mockQuery);

      expect(result.runtimeType, ApiError<ForecastResponse>);
      expect(result.asError.toString(),
          'Exception: There was an error when fetching data.');
    });

    test(
        'should return ApiEmptyResponse if http service returns an empty response',
        () async {
      when(() => httpService.request<ForecastResponse, Map<String, dynamic>>(
              requestType: HttpRequestType.get,
              onResult: any(named: 'onResult'),
              url: any(named: 'url')))
          .thenAnswer((_) async => ApiEmptyResponse<ForecastResponse>());

      final ApiResponse<ForecastResponse> result =
          await repository.getCurrentForecast(mockQuery);

      expect(result.runtimeType, ApiEmptyResponse<ForecastResponse>);
    });
  });
}

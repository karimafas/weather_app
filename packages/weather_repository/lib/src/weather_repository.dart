import 'package:http_service/http_service.dart';
import 'package:weather_repository/src/constants/endpoints.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({required this.httpService, required this.apiKey});

  final HttpService httpService;
  final String? apiKey;

  Future<ApiResponse<ForecastResponse>> getCurrentForecast(String query) =>
      httpService.request<ForecastResponse, Map<String, dynamic>>(
          requestType: HttpRequestType.get,
          onResult: (Map<String, dynamic> response) =>
              ForecastResponse.fromJson(response),
          url:
              '$getCurrentForecastUrl?access_key=$apiKey&query=${Uri.encodeComponent(query)}');
}

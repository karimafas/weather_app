import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/src/models/current_forecast.dart';
import 'package:weather_repository/src/models/forecast_location.dart';
import 'package:weather_repository/src/models/forecast_request.dart';

part 'forecast_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastResponse {
  ForecastResponse(
      {required this.request, required this.location, required this.current});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);

  final ForecastRequest request;
  final ForecastLocation location;
  final CurrentForecast current;
}

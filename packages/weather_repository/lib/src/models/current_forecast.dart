import 'package:json_annotation/json_annotation.dart';

part 'current_forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentForecast {
  CurrentForecast(
      {required this.observationTime,
      required this.windDirection,
      required this.weatherIcons,
      required this.weatherDescriptions,
      required this.temperature,
      required this.weatherCode,
      required this.windSpeed,
      required this.windDegree,
      required this.pressure,
      required this.precipitation,
      required this.humidity,
      required this.uvIndex,
      required this.visibility,
      required this.feelsLike,
      required this.cloudCover});

  factory CurrentForecast.fromJson(Map<String, dynamic> json) =>
      _$CurrentForecastFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentForecastToJson(this);

  final String observationTime;
  @JsonKey(name: 'wind_dir')
  final String windDirection;
  @JsonKey(defaultValue: <String>[])
  final List<String> weatherIcons, weatherDescriptions;
  final double temperature;
  final int weatherCode,
      windSpeed,
      windDegree,
      pressure,
      humidity,
      uvIndex,
      visibility;
  @JsonKey(name: 'precip')
  final int precipitation;
  @JsonKey(name: 'feelslike')
  final double feelsLike;
  @JsonKey(name: 'cloudcover')
  final int cloudCover;
}

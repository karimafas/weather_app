// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentForecast _$CurrentForecastFromJson(Map<String, dynamic> json) =>
    CurrentForecast(
      observationTime: json['observation_time'] as String,
      windDirection: json['wind_dir'] as String,
      weatherIcons: (json['weather_icons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      weatherDescriptions: (json['weather_descriptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      temperature: json['temperature'] as int,
      weatherCode: json['weather_code'] as int,
      windSpeed: json['wind_speed'] as int,
      windDegree: json['wind_degree'] as int,
      pressure: json['pressure'] as int,
      precipitation: json['precip'] as int,
      humidity: json['humidity'] as int,
      uvIndex: json['uv_index'] as int,
      visibility: json['visibility'] as int,
      feelsLike: json['feelslike'] as int,
      cloudCover: json['cloudcover'] as int,
    );

Map<String, dynamic> _$CurrentForecastToJson(CurrentForecast instance) =>
    <String, dynamic>{
      'observation_time': instance.observationTime,
      'wind_dir': instance.windDirection,
      'weather_icons': instance.weatherIcons,
      'weather_descriptions': instance.weatherDescriptions,
      'temperature': instance.temperature,
      'weather_code': instance.weatherCode,
      'wind_speed': instance.windSpeed,
      'wind_degree': instance.windDegree,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'uv_index': instance.uvIndex,
      'visibility': instance.visibility,
      'precip': instance.precipitation,
      'feelslike': instance.feelsLike,
      'cloudcover': instance.cloudCover,
    };

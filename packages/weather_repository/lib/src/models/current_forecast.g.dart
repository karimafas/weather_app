// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentForecast _$CurrentForecastFromJson(Map<String, dynamic> json) =>
    CurrentForecast(
      observationTime: json['observation_time'] as String,
      windDirection: json['wind_dir'] as String,
      weatherIcons: (json['weather_icons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      weatherDescriptions: (json['weather_descriptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      temperature: (json['temperature'] as num).toDouble(),
      weatherCode: (json['weather_code'] as num).toDouble(),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDegree: (json['wind_degree'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      precipitation: (json['precip'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      uvIndex: (json['uv_index'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      feelsLike: (json['feelslike'] as num).toDouble(),
      cloudCover: (json['cloudcover'] as num).toDouble(),
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse(
      request:
          ForecastRequest.fromJson(json['request'] as Map<String, dynamic>),
      location:
          ForecastLocation.fromJson(json['location'] as Map<String, dynamic>),
      current:
          CurrentForecast.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'location': instance.location.toJson(),
      'current': instance.current.toJson(),
    };

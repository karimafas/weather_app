// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastRequest _$ForecastRequestFromJson(Map<String, dynamic> json) =>
    ForecastRequest(
      type: json['type'] as String,
      query: json['query'] as String,
      language: json['language'] as String,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ForecastRequestToJson(ForecastRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'query': instance.query,
      'language': instance.language,
      'unit': instance.unit,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastLocation _$ForecastLocationFromJson(Map<String, dynamic> json) =>
    ForecastLocation(
      name: json['name'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      lat: json['lat'] as String,
      lon: json['lon'] as String,
      timezoneId: json['timezone_id'] as String,
      localtime: json['localtime'] as String,
      utcOffset: json['utc_offset'] as String,
      localtimeEpoch: json['localtime_epoch'] as int,
    );

Map<String, dynamic> _$ForecastLocationToJson(ForecastLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'region': instance.region,
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone_id': instance.timezoneId,
      'localtime': instance.localtime,
      'utc_offset': instance.utcOffset,
      'localtime_epoch': instance.localtimeEpoch,
    };

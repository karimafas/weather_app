import 'package:json_annotation/json_annotation.dart';

part 'forecast_location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ForecastLocation {
  ForecastLocation(
      {required this.name,
      required this.country,
      required this.region,
      required this.lat,
      required this.lon,
      required this.timezoneId,
      required this.localtime,
      required this.utcOffset,
      required this.localtimeEpoch});

  factory ForecastLocation.fromJson(Map<String, dynamic> json) =>
      _$ForecastLocationFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastLocationToJson(this);

  final String name,
      country,
      region,
      lat,
      lon,
      timezoneId,
      localtime,
      utcOffset;
  final int localtimeEpoch;
}

import 'package:json_annotation/json_annotation.dart';

part 'forecast_request.g.dart';

@JsonSerializable()
class ForecastRequest {
  ForecastRequest(
      {required this.type,
      required this.query,
      required this.language,
      required this.unit});

  factory ForecastRequest.fromJson(Map<String, dynamic> json) =>
      _$ForecastRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastRequestToJson(this);

  final String type, query, language, unit;
}

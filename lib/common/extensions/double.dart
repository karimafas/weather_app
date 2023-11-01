extension DoubleHelpers on double {
  String formatTemperature({String unit = 'C'}) =>
      '${toStringAsFixed(0)}°$unit';
}

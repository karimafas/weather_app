enum EnvKey {
  weatherApiKey;

  String get value {
    switch (this) {
      case EnvKey.weatherApiKey:
        return 'WEATHER_API_KEY';
    }
  }
}

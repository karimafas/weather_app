const Map<String, dynamic> testWeatherResponse = <String, dynamic>{
  'request': <String, String>{
    'type': 'City',
    'query': 'New York, United States of America',
    'language': 'en',
    'unit': 'm'
  },
  'location': <String, dynamic>{
    'name': 'New York',
    'country': 'United States of America',
    'region': 'New York',
    'lat': '40.714',
    'lon': '-74.006',
    'timezone_id': 'America/New_York',
    'localtime': '2019-09-07 08:14',
    'localtime_epoch': 1567844040,
    'utc_offset': '-4.0'
  },
  'current': <String, dynamic>{
    'observation_time': '12:14 PM',
    'temperature': 13,
    'weather_code': 113,
    'weather_icons': <String>[
      'https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png'
    ],
    'weather_descriptions': <String>['Sunny'],
    'wind_speed': 0,
    'wind_degree': 349,
    'wind_dir': 'N',
    'pressure': 1010,
    'precip': 0,
    'humidity': 90,
    'cloudcover': 0,
    'feelslike': 13,
    'uv_index': 4,
    'visibility': 16
  }
};

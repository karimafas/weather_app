import 'package:get_it/get_it.dart';
import 'package:http_service/http_service.dart';
import 'package:logger_service/logger_service.dart';
import 'package:weather_app/common/enums/env_key.dart';
import 'package:weather_app/common/env/app_env.dart';
import 'package:weather_repository/weather_repository.dart';

class ServiceLocator {
  static GetIt get instance => GetIt.instance;

  static Future<void> registerSingletons() async {
    final AppEnv appEnv = AppEnv();
    await appEnv.initialise();

    final LoggerService loggerService = LoggerService();
    final HttpService httpService = HttpService(logger: loggerService);
    final WeatherRepository weatherRepository = WeatherRepository(
        httpService: httpService,
        apiKey: appEnv.getValue(EnvKey.weatherApiKey));

    instance.registerSingleton<LoggerService>(loggerService);
    instance.registerSingleton<WeatherRepository>(weatherRepository);
  }
}

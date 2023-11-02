import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/common/enums/env_key.dart';

class AppEnv {
  AppEnv({this.dotEnv}) {
    dotEnv ??= DotEnv();
  }
  DotEnv? dotEnv;

  Future<void> initialise() async {
    await dotEnv!.load(fileName: 'assets/env/.env');
  }

  String? getValue(EnvKey key) => dotEnv!.get(key.value);
}

import 'package:logger/logger.dart';

class LoggerService {
  LoggerService({this.logger}) {
    logger ??= Logger();
  }
  Logger? logger;

  void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger?.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger?.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  void warning(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger?.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger?.e(message, time: time, error: error, stackTrace: stackTrace);
  }
}

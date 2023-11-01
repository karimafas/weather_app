import 'package:logger/logger.dart';
import 'package:logger_service/logger_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('LoggerService', () {
    const String message = 'testMessage';
    late MockLogger logger;
    late LoggerService service;

    setUp(() {
      logger = MockLogger();
      service = LoggerService(logger: logger);
    });

    test('should call logger.d for debug', () {
      service.debug(message);
      verify(() => logger.d(message)).called(1);
    });

    test('should call logger.i for info', () {
      service.info(message);
      verify(() => logger.i(message)).called(1);
    });

    test('should call logger.w for warning', () {
      service.warning(message);
      verify(() => logger.w(message)).called(1);
    });

    test('should call logger.e for error', () {
      service.error(message);
      verify(() => logger.e(message)).called(1);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_service/http_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/locations/bloc/locations_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../../data/common_test_data.dart';

void main() {
  final Exception exception = Exception('Could not load forecast.');

  group('$LocationsBloc', () {
    late MockWeatherRepository weatherRepository;
    late LocationsBloc bloc;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      bloc = LocationsBloc(weatherRepository: weatherRepository);
    });

    blocTest<LocationsBloc, LocationsState>(
      'it should emit $LocationsSuccess if at least 1 weather forecast response is returned by the repository',
      build: () {
        when(() => weatherRepository.getCurrentForecast(any())).thenAnswer(
          (_) async => ApiSuccess<ForecastResponse>(testForecastResponse),
        );
        return bloc;
      },
      act: (LocationsBloc bloc) => bloc.add(const LoadInitialLocations()),
      expect: () => <LocationsState>[
        LocationsSuccess(<ForecastResponse>[
          testForecastResponse,
          testForecastResponse,
          testForecastResponse,
          testForecastResponse
        ])
      ],
      verify: (LocationsBloc bloc) {
        verify(() => weatherRepository.getCurrentForecast('London, UK'))
            .called(1);
        verify(() => weatherRepository.getCurrentForecast('Manchester, UK'))
            .called(1);
        verify(() => weatherRepository.getCurrentForecast('Brighton, UK'))
            .called(1);
        verify(() => weatherRepository.getCurrentForecast('Birmingham, UK'))
            .called(1);
      },
    );

    blocTest<LocationsBloc, LocationsState>(
      'it should emit $LocationsError if no weather forecast responses are returned by the repository',
      build: () {
        when(() => weatherRepository.getCurrentForecast(any())).thenAnswer(
          (_) async => ApiError<ForecastResponse>(exception),
        );
        return bloc;
      },
      act: (LocationsBloc bloc) => bloc.add(const LoadInitialLocations()),
      expect: () => <LocationsState>[LocationsError(exception)],
    );
  });
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_service/http_service.dart';
import 'package:weather_repository/weather_repository.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc({required this.weatherRepository})
      : super(const LocationsLoading()) {
    on<LoadInitialLocations>(_loadInitialLocations);
  }

  final WeatherRepository weatherRepository;

  Future<void> _loadInitialLocations(
      LoadInitialLocations event, Emitter<LocationsState> emit) async {
    final List<ForecastResponse> forecastResponses = <ForecastResponse>[];
    final List<String> locationsToLoad = <String>[
      'London, UK',
      'Manchester, UK',
      'Brighton, UK',
      'Birmingham, UK'
    ];
    for (final String location in locationsToLoad) {
      final ApiResponse<ForecastResponse> result =
          await weatherRepository.getCurrentForecast(location);
      if (result.isSuccess) {
        forecastResponses.add(result.asSuccess);
      }
    }

    if (forecastResponses.isEmpty) {
      return emit(
          LocationsError(Exception('There was an issue loading locations.')));
    }
    emit(LocationsSuccess(forecastResponses));
  }
}

part of 'locations_bloc.dart';

abstract class LocationsState extends Equatable {
  const LocationsState();

  @override
  List<Object?> get props => <Object?>[];
}

class LocationsLoading extends LocationsState {
  const LocationsLoading();
}

class LocationsError extends LocationsState {
  const LocationsError(this.error);
  final dynamic error;
}

class LocationsSuccess extends LocationsState {
  const LocationsSuccess(this.result);
  final List<ForecastResponse> result;
}

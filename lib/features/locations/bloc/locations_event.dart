part of 'locations_bloc.dart';

abstract class LocationsEvent {
  const LocationsEvent();
}

class LoadInitialLocations extends LocationsEvent {
  const LoadInitialLocations();
}

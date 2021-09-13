import 'dart:async';
import 'package:ordernow_client/models/place.model.dart';
import 'package:ordernow_client/resources/restaurants.provider.dart';

class RestaurantsBloc {
  late List<Restaurant> places;
  late final PlacesProvider _placesProvider;

  late final _stateStreamController;

  RestaurantsBloc()
      : this._stateStreamController = StreamController<Restaurant>() {
    this._placesProvider = PlacesProvider();
  }

  StreamSink<Restaurant> get _placesBlocSink => _stateStreamController.sink;
  Stream<Restaurant> get placesBlocStream => _stateStreamController.stream;

  void fetchPlaces() {
    _placesProvider.fetchPlaces(_placesBlocSink);
  }

  void dispose() {
    _stateStreamController.close();
  }
}

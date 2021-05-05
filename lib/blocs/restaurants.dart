import 'dart:async';

import 'package:ordernow_client/models/restaurant.dart';
import 'package:ordernow_client/resources/restaurants_provider.dart';

class RestaurantsBloc {
  List<Restaurant> restaurants;
  RestaurantsProvider _restaurantsProvider = RestaurantsProvider();

  final _stateStreamController = StreamController<List<Restaurant>>();

  StreamSink<List<Restaurant>> get _restaurantsBlocSink =>
      _stateStreamController.sink;
  Stream<List<Restaurant>> get restaurantsBlocStream =>
      _stateStreamController.stream;

  void fetchRestaurants() async {
    restaurants = await _restaurantsProvider.fetchRestaurantsList();
    _restaurantsBlocSink.add(restaurants);
  }

  void dispose() {
    _stateStreamController.close();
  }
}

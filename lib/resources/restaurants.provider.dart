import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:ordernow_client/models/place.model.dart';

class PlacesProvider {
  void fetchPlaces(StreamSink<Restaurant>? _restaurantsBlocSink) {
    //makes the request
    final _serverUri =
        Uri(scheme: 'http', host: 'localhost', port: 8097, path: '/fetch');
    final request = Request('GET', _serverUri);
    request.send().asStream().listen((StreamedResponse response) {
      Stream st =
          response.stream.transform(utf8.decoder).transform(json.decoder);
      // response.stream
      //     .transform(
      //         utf8.decoder) //converts the stream of bytes to stream of string
      //     .transform(
      //         json.decoder) //converts the stream of string to stream of json
      //     .map((json) => Restaurant().fromJson(
      //         json)) //converts the stream of json to a stream of restaurant
      //     .pipe(_restaurantsBlocSink);
    });
  }
}

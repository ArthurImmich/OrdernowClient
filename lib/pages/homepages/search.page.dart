import 'package:flutter/material.dart';
import 'package:ordernow_client/blocs/places.bloc.dart';
import 'package:ordernow_client/models/place.model.dart';
import 'package:ordernow_client/pages/widgets/place_card.widget.dart';

class AppBarSearch extends StatefulWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration().copyWith(
          hintText: 'Procure por estabelecimentos...',
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 8, 16),
            child: Icon(Icons.search_sharp),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final RestaurantsBloc _placesBloc;
  late List<Restaurant> _places;

  @override
  void initState() {
    String img = 'https://files.menudino.com/cardapios/10912/logo.png';
    _places = [
      Restaurant(
          name: "[Nome do estabelecimento]",
          address: "[Endereço do estabelecimento]",
          image: img),
      Restaurant(
          name: "[Nome do estabelecimento]",
          address: "[Endereço do estabelecimento]",
          image: img),
      Restaurant(
          name: "[Nome do estabelecimento]",
          address: "[Endereço do estabelecimento]",
          image: img),
    ];
    _placesBloc = RestaurantsBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListPlacesStreamBuilder(placesBloc: _placesBloc, places: _places),
    );
  }
}

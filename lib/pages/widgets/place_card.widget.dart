import 'package:flutter/material.dart';
import 'package:ordernow_client/blocs/places.bloc.dart';
import 'package:ordernow_client/models/place.model.dart';
import 'package:ordernow_client/router/delegate.dart';
import 'package:ordernow_client/router/ui_pages.dart';

import '../products.page.dart';

class ListPlacesStreamBuilder extends StatelessWidget {
  const ListPlacesStreamBuilder({
    Key? key,
    required RestaurantsBloc placesBloc,
    required List<Restaurant> places,
  })  : _placesBloc = placesBloc,
        _places = places,
        super(key: key);

  final RestaurantsBloc _placesBloc;
  final List<Restaurant> _places;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Restaurant>(
      stream: _placesBloc.placesBlocStream,
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Center(child: CircularProgressIndicator());
        // } else if (snapshot.hasError) {
        //   return Text(snapshot.error.toString());
        if (snapshot.hasData) _places.add(snapshot.data!);
        return ListView.separated(
          separatorBuilder: (context, _) => Divider(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
                borderRadius: BorderRadius.circular(8),
                child: PlaceCard(place: _places[index]),
                onTap: () {
                  (Router.of(context).routerDelegate as Delegate)
                      .pushWidget(Products(index), listProductsPageConfig);
                });
          },
          itemCount: _places.length,
        );
      },
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Restaurant _place;

  const PlaceCard({Key? key, required Restaurant place})
      : _place = place,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            _place.image!,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _place.name!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Text('4', style: Theme.of(context).textTheme.caption),
                        Icon(Icons.star, size: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text('12km',
                              style: Theme.of(context).textTheme.caption),
                        ),
                        Text('50-70 min',
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                  Text(_place.address!,
                      style: Theme.of(context).textTheme.bodyText2)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

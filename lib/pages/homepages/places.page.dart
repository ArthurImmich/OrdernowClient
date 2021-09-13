import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ordernow_client/blocs/places.bloc.dart';
import 'package:ordernow_client/models/place.model.dart';
import 'package:ordernow_client/pages/cart.page.dart';
import 'package:ordernow_client/pages/products.page.dart';
import 'package:ordernow_client/pages/widgets/place_card.widget.dart';
import 'package:ordernow_client/router/ui_pages.dart';
import '../../../router/delegate.dart';

class AppBarPlaces extends StatefulWidget {
  AppBarPlaces({Key? key}) : super(key: key);

  @override
  _AppBarPlacesState createState() => _AppBarPlacesState();
}

class _AppBarPlacesState extends State<AppBarPlaces> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Estabelecimentos'),
      actions: [
        IconButton(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16),
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () => (Router.of(context).routerDelegate as Delegate)
              .pushWidget(Cart(), cartPageConfig),
        )
      ],
    );
  }
}

class Places extends StatefulWidget {
  Places({Key? key}) : super(key: key);

  @override
  PlacesState createState() => PlacesState();
}

class PlacesState extends State<Places> {
  late List<Restaurant> _places;
  late List<Image> _advertisements;
  late final List<ListTile> _categories;
  late final RestaurantsBloc _placesBloc;

  @override
  void initState() {
    String img = 'https://files.menudino.com/cardapios/10912/logo.png';
    _categories = [
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: Text('Restaurantes'),
        leading: Image.asset(
          'assets/images/restaurante.png',
          height: 40,
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: Text('Bares'),
        leading: Image.asset(
          'assets/images/bar.png',
          height: 40,
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: Text('Sorveterias'),
        leading: Image.asset(
          'assets/images/sorveteria.png',
          height: 40,
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: Text('Lanchonetes'),
        leading: Image.asset(
          'assets/images/lanchonete.png',
          height: 40,
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: Text('Cafeterias'),
        leading: Image.asset(
          'assets/images/cafeteria.png',
          height: 40,
        ),
      ),
    ];
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
    _advertisements = [
      Image.network(
        'https://maringapost.com.br/wp-content/uploads/2020/11/Cathedral.jpg',
        fit: BoxFit.cover,
        height: 200,
      ),
      Image.network(
        'https://maringapost.com.br/wp-content/uploads/2020/11/Cathedral.jpg',
        fit: BoxFit.cover,
        height: 200,
      ),
    ];
    // _restaurantsBloc.fetchRestaurants();
    _placesBloc = RestaurantsBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "[Rua Gaspar Silveira Martins, 650 - RS - Brasil]",
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    'Ofertas',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: CarouselSlider.builder(
                    itemCount: _advertisements.length,
                    itemBuilder: (context, index, _) {
                      return ClipRRect(
                        child: _advertisements[index],
                        borderRadius: BorderRadius.circular(8),
                      );
                    },
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(
                      'Categorias',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Divider(),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: _categories,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    'Estabelecimentos',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListPlacesStreamBuilder(
                      placesBloc: _placesBloc, places: _places),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ordernow_client/pages/homepages/orders.page.dart';
import 'package:ordernow_client/pages/homepages/profile.page.dart';
import 'package:ordernow_client/pages/homepages/places.page.dart';
import 'package:ordernow_client/pages/homepages/search.page.dart';
import 'package:ordernow_client/router/delegate.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  late final List<Widget> _homePages;
  late final List<AppBar> _appBars;
  late int _selectedPage;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    widget._homePages = [
      Places(),
      Search(),
      Orders(),
      Profile(),
    ];

    widget._appBars = [
      AppBarPlaces().createState().build(context),
      AppBarSearch().createState().build(context),
      AppBarOrders().createState().build(context),
      AppBarProfile().createState().build(context),
    ];
    widget._selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget._appBars[widget._selectedPage],
      body: widget._homePages[widget._selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget._selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            tooltip: 'Estabelecimentos',
            label: 'Estabelecimentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            tooltip: 'Procurar',
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            tooltip: 'Pedidos',
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            tooltip: 'Perfil',
            label: 'Perfil',
          ),
        ],
        onTap: (index) => setState(() => widget._selectedPage = index),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../router/delegate.dart';
import 'package:ordernow_client/ui/details.dart';
import '../router/ui_pages.dart';

class ListRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Restaurants $i');
    Delegate delegate = Router.of(context).routerDelegate;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Items for sale',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => delegate.push(settingsPageConfig)),
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () => delegate.push(checkoutPageConfig))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
              onTap: () {
                detailsPageConfig.path = DetailsPath + '/$index';
                delegate.pushWidget(Details(index), detailsPageConfig);
              },
            );
          },
        ),
      ),
    );
  }
}

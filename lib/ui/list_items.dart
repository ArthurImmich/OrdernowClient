import 'package:flutter/material.dart';
import 'package:ordernow/router/navigator.dart';
import 'package:ordernow/ui/details.dart';
import '../router/ui_pages.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    
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
              onPressed: () => OrdernowNavigator.of(context).delegate
                .push(SettingsPageConfig)),
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () => OrdernowNavigator.of(context).delegate
                .push(CheckoutPageConfig))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
              onTap: () {
                OrdernowNavigator.of(context).delegate
                  .pushWidget(Details(index), DetailsPageConfig);
              },
            );
          },
        ),
      ),
    );
  }
}

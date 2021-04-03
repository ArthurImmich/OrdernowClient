import 'package:flutter/material.dart';
import '../router/delegate.dart';
import 'package:OrdernowClient/ui/details.dart';
import '../router/ui_pages.dart';

class ListProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(100, (i) => 'Products $i');

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
              onPressed: () => Delegate.instance.push(settingsPageConfig)),
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () => Delegate.instance.push(checkoutPageConfig))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
              onTap: () {
                Delegate.instance.pushWidget(Details(index), detailsPageConfig);
              },
            );
          },
        ),
      ),
    );
  }
}

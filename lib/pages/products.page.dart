import 'package:flutter/material.dart';
import '../router/delegate.dart';
import 'package:ordernow_client/pages/details.page.dart';
import '../router/ui_pages.dart';

class Products extends StatelessWidget {
  final int id;
  Products(this.id);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Products $i');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products for sale restaurant $id',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () => (Router.of(context).routerDelegate as Delegate)
                  .push(checkoutPageConfig))
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
                (Router.of(context).routerDelegate as Delegate)
                    .pushWidget(Details(index), detailsPageConfig);
              },
            );
          },
        ),
      ),
    );
  }
}

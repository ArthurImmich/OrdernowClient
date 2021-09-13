import 'package:ordernow_client/router/delegate.dart';
import 'package:flutter/material.dart';
import '../cart_holder.dart';
import '../router/ui_pages.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartHolder = CartHolder();
    final items = cartHolder.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
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
            );
          },
        ),
      ),
    );
  }
}

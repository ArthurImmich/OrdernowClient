import 'package:flutter/material.dart';
import '../router/delegate.dart';
import '../cart_holder.dart';
import '../router/ui_pages.dart';

class Details extends StatelessWidget {
  final int id;

  const Details(this.id);

  @override
  Widget build(BuildContext context) {
    final cartHolder = CartHolder();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product $id',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  cartHolder.addItem('Item $id');
                  (Router.of(context).routerDelegate as Delegate).popRoute();
                },
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () => (Router.of(context).routerDelegate as Delegate)
                    .push(cartPageConfig),
                child: const Text('Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

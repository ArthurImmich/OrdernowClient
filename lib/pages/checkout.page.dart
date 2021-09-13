import 'package:flutter/material.dart';
import '../cart_holder.dart';
import '../router/delegate.dart';
import '../router/ui_pages.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartHolder = CartHolder();
    final items = cartHolder.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${items[index]}'),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      (Router.of(context).routerDelegate as Delegate)
                          .setNewRoutePath(homePageConfig);
                    },
                    child: const Text('Back To List'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartHolder.clear();
                      (Router.of(context).routerDelegate as Delegate)
                          .setNewRoutePath(homePageConfig);
                    },
                    child: const Text('Clear Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

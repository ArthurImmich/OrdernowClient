import 'package:flutter/material.dart';
import '../router/delegate.dart';
import '../cart_holder.dart';
import '../router/ui_pages.dart';

class Details extends StatelessWidget {
  final int id;

  const Details(this.id);

  @override
  Widget build(BuildContext context) {
    Delegate delegate = Router.of(context).routerDelegate;
    final cartHolder = CartHolder();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Product $id',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
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
                  delegate.popRoute();
                },
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () => delegate.push(cartPageConfig),
                child: const Text('Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

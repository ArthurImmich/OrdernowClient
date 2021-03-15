import 'package:flutter/material.dart';
import 'package:ordernow/router/navigator.dart';
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
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Item $id',
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
                  OrdernowNavigator.of(context).delegate.popRoute();
                },
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () => OrdernowNavigator.of(context).delegate
                  .push(CartPageConfig),
                child: const Text('Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

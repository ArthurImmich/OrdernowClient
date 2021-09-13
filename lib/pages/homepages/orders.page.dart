import 'package:flutter/material.dart';

class AppBarOrders extends StatefulWidget {
  const AppBarOrders({Key? key}) : super(key: key);

  @override
  _AppBarOrdersState createState() => _AppBarOrdersState();
}

class _AppBarOrdersState extends State<AppBarOrders> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Pedidos'),
    );
  }
}

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Orders'));
  }
}

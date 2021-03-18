import 'package:flutter/material.dart';
import 'package:OrdernowClient/router/back_dispatcher.dart';
import 'router/delegate.dart';
import 'router/parser.dart';

void main() => runApp(const OrdernowApp());

class OrdernowApp extends StatefulWidget {
  const OrdernowApp({Key key}) : super(key: key);

  @override
  _OrdernowAppState createState() => _OrdernowAppState();
}

class _OrdernowAppState extends State<OrdernowApp> {
  final Parser _ordernowParser = Parser();
  BackButtonDispatcher _backButtonDispatcher;

  //Set state according to URI
  Future<void> initPlatformState() async {
    _backButtonDispatcher = BackDispatcher(Delegate.instance);
    final uri = Uri.base;
    print("init platform");
    if (!mounted) return;
    setState(() {
      Delegate.instance.parseRoute(uri);
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ordernow',
      routeInformationParser: _ordernowParser,
      routerDelegate: Delegate.instance,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}

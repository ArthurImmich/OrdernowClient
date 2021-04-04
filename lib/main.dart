import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ordernow_client/router/back_dispatcher.dart';
import 'package:ordernow_client/router/ui_pages.dart';
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
  Delegate delegate = Delegate();

  //Set state according to URI
  Future<void> initPlatformState() async {
    _backButtonDispatcher = BackDispatcher(delegate);
    if (!mounted) return;
    setState(() {
      delegate.push(splashPageConfig);
    });
  }

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ordernow',
      routeInformationParser: _ordernowParser,
      routerDelegate: delegate,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}

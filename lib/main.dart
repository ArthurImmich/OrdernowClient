import 'package:flutter/material.dart';
import 'package:ordernow/router/back_dispatcher.dart';
import 'package:ordernow/router/navigator.dart';
import 'package:ordernow/router/ui_pages.dart';
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
  final Delegate _ordernowRouterDelegate =
   Delegate();
  BackButtonDispatcher _backButtonDispatcher;

  //contructor
  _OrdernowAppState() {
    _ordernowRouterDelegate.setNewRoutePath(SplashPageConfig);
    _backButtonDispatcher = 
      BackDispatcher(_ordernowRouterDelegate);
  }

  //Set state according to URI
  Future<void> initPlatformState() async {
    final uri = Uri.base;
    if (!mounted) return;
    setState(() {
      _ordernowRouterDelegate.parseRoute(uri);
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return OrdernowNavigator(
      delegate: _ordernowRouterDelegate,
      child: MaterialApp.router(
        title: 'Ordernow',
        routeInformationParser: _ordernowParser,
        routerDelegate: _ordernowRouterDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ordernow_client/router/back_button.dart';
import 'package:ordernow_client/router/ui_pages.dart';
import 'package:ordernow_client/themes/light.theme.dart';
import 'router/delegate.dart';
import 'router/parser.dart';

void main() => runApp(const OrdernowApp());

class OrdernowApp extends StatefulWidget {
  const OrdernowApp({Key? key}) : super(key: key);

  @override
  _OrdernowAppState createState() => _OrdernowAppState();
}

class _OrdernowAppState extends State<OrdernowApp> {
  late final Parser _ordernowParser;
  late final BackButtonDispatcher _backButtonDispatcher;
  late final Delegate _delegate;

  @override
  void initState() {
    _delegate = Delegate();
    _ordernowParser = Parser();
    _backButtonDispatcher = BackDispatcher(_delegate);
    if (!mounted) return;
    setState(() => _delegate.push(splashPageConfig));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ordernow',
      theme: LightTheme.theme,
      routeInformationParser: _ordernowParser,
      routerDelegate: _delegate,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}

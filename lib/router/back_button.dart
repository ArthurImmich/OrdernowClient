import 'package:flutter/material.dart';
import 'delegate.dart';

class BackDispatcher extends RootBackButtonDispatcher {
  final Delegate _routerDelegate;

  BackDispatcher(this._routerDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}

import 'package:flutter/widgets.dart';
import 'delegate.dart';

class OrdernowNavigator extends InheritedWidget {


  final Delegate delegate;
  const OrdernowNavigator({Key key, this.child, this.delegate}) 
    : super(key: key, child: child);


  @override
  final Widget child;

  static OrdernowNavigator of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<OrdernowNavigator>();
  }

  @override
  bool updateShouldNotify(OrdernowNavigator oldWidget) => oldWidget != child;
}
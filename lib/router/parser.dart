import 'package:flutter/material.dart';
import 'ui_pages.dart';

class Parser extends RouteInformationParser<PageConfiguration> {
  //Converts the url into the navigation state.
  //Called when the url is updated.
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    //if there is no URI, returns splash
    if (uri.pathSegments.isEmpty) {
      return splashPageConfig;
    }
    final path = "/" + uri.pathSegments[0];

    switch (path) {
      case SplashPath:
        return splashPageConfig;
      case LoginPath:
        return loginPageConfig;
      case CreateAccountPath:
        return createAccountPageConfig;
      case HomePath:
        return homePageConfig;
      case ListProductsPath:
        listProductsPageConfig.path =
            ListProductsPath + '/' + uri.pathSegments[1];
        return listProductsPageConfig;
      case DetailsPath:
        detailsPageConfig.path = DetailsPath + '/' + uri.pathSegments[1];
        return detailsPageConfig;
      case CartPath:
        return cartPageConfig;
      case CheckoutPath:
        return checkoutPageConfig;
      default:
        return splashPageConfig;
    }
  }

  //Takes a navigation state and then convert it into a url.
  //Called after routerDelegate.currentConfiguration
  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    return RouteInformation(location: configuration.path);
  }
}

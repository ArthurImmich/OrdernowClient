import 'package:flutter/material.dart';
import 'ui_pages.dart';

class Parser extends RouteInformationParser<PageConfiguration> {

  //Converts the url into the navigation state.
  //Called when the url is updated.
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {

    final uri = Uri.parse(routeInformation.location);

    //if there is no URI, returns splash
    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig;
    }

    final path = "/" + uri.pathSegments[0];
    print(path);

    switch (path) {
      case SplashPath:
        return SplashPageConfig;
      case LoginPath:
        return LoginPageConfig;
      case CreateAccountPath:
        return CreateAccountPageConfig;
      case ListItemsPath:
        return ListItemsPageConfig;
      case DetailsPath:
        return DetailsPageConfig;
      case CartPath:
        return CartPageConfig;
      case CheckoutPath:
        return CheckoutPageConfig;
      case SettingsPath:
        return SettingsPageConfig;
      default:
        return SplashPageConfig;
    }

  }

  //Takes a navigation state and then convert it into a url.
  //Called after routerDelegate.currentConfiguration
  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.Splash:
        return const RouteInformation(location: SplashPath);
      case Pages.Login:
        return const RouteInformation(location: LoginPath);
      case Pages.CreateAccount:
        return const RouteInformation(location: CreateAccountPath);
      case Pages.List:
        return const RouteInformation(location: ListItemsPath);
      case Pages.Details:
        return const RouteInformation(location: DetailsPath);
      case Pages.Cart:
        return const RouteInformation(location: CartPath);
      case Pages.Checkout:
        return const RouteInformation(location: CheckoutPath);
      case Pages.Settings:
        return const RouteInformation(location: SettingsPath);
      default: return const RouteInformation(location: SplashPath);
    }
  }
}
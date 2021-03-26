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
      case ListItemsPath:
        return listItemsPageConfig;
      case DetailsPath:
        PageConfiguration detailsConfiguration = detailsPageConfig;
        detailsConfiguration.path = detailsConfiguration.path + "/" + uri.pathSegments[1];
        return detailsConfiguration;
      case CartPath:
        return cartPageConfig;
      case CheckoutPath:
        return checkoutPageConfig;
      case SettingsPath:
        return settingsPageConfig;
      default:
        return splashPageConfig;
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
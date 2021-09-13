import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ordernow_client/pages/home.page.dart';
import '../pages/details.page.dart';
import '../pages/cart.page.dart';
import '../pages/checkout.page.dart';
import '../pages/create_account.page.dart';
import '../pages/products.page.dart';
import '../pages/login.page.dart';
import '../pages/splash.page.dart';
import 'ui_pages.dart';

class Delegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  //Pages list
  final List<Page> _pages = [];
  //Back button dispatcher
  late final BackButtonDispatcher backButtonDispatcher;

  //Allows only one instance of this RouterDelegate and it
  //can be acessed from anywhere
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  Delegate() : navigatorKey = GlobalKey<NavigatorState>();

  //Gets the current list of pages
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  //Gets the arguments of the last page in the
  //list as PageConfiguration (created type)
  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  //Returns true when the page did pop and removes it
  //from the _pages list and notifies its listeners.
  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pages.remove(route.settings);
    notifyListeners();
    return true;
  }

  //Builds the navigator using the global key and onPopPage methods
  //Pass the _pages list as an argument
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  //Removes a page from _pages list and notifies its listners
  void _removePage(MaterialPage page) {
    _pages.remove(page);
    notifyListeners();
  }

  //Calls _removePage only if _pages lenght is bigger than 1
  //Returns a future boolean confirming it or not
  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last as MaterialPage<dynamic>);
      return Future.value(true);
    }
    return Future.value(false);
  }

  //Creates the necessary Navigator MaterialPage's
  //whith the pages key, configuration and path as name
  //and a child widgets corresponding the page.
  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: Key(pageConfig.key) as LocalKey,
        name: pageConfig.path,
        arguments: pageConfig);
  }

  //Adds the MaterialPage to the _pages list
  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  //Calls _addPageData with the necessary arguments only if _pages list is
  //empty or the last pages is different from the page trying to be added.
  void push(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;
    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.Splash:
          _addPageData(Splash(), splashPageConfig);
          break;
        case Pages.Login:
          _addPageData(Login(), loginPageConfig);
          break;
        case Pages.CreateAccount:
          _addPageData(CreateAccount(), createAccountPageConfig);
          break;
        case Pages.Home:
          _addPageData(Home(), homePageConfig);
          break;
        case Pages.Products:
          _addPageData(
              Products(int.parse(Uri.parse(pageConfig.path).pathSegments[1])),
              listProductsPageConfig);
          break;
        case Pages.Details:
          _addPageData(
              Details(int.parse(Uri.parse(pageConfig.path).pathSegments[1])),
              detailsPageConfig);
          break;
        case Pages.Cart:
          _addPageData(Cart(), cartPageConfig);
          break;
        case Pages.Checkout:
          _addPageData(Checkout(), checkoutPageConfig);
          break;
        default:
          break;
      }
      notifyListeners();
    }
  }

  //Replaces last page by a new one
  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(newRoute);
  }

  //Changes the current _pages list by a new one
  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
    notifyListeners();
  }

  //
  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
    notifyListeners();
  }

  //Clears _page list and adds a new page
  //Get the information from parseRouteInformation
  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    _pages.clear();
    push(configuration);
  }

  //Returns the page that matches routeName
  MaterialPage _getPage(Pages routeName) {
    return _pages.lastWhere((element) =>
            (element.arguments as PageConfiguration).uiPage == routeName)
        as MaterialPage<dynamic>;
  }

  //Handles URL and sets routes according to it
  void parseRoute(Uri uri) {
    print(uri);
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(splashPageConfig);
      return;
    }

    //Handle navapp://deeplinks/details/#
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'details') {
        PageConfiguration detailsConfiguration = detailsPageConfig;
        detailsConfiguration.path =
            detailsConfiguration.path + "/" + uri.pathSegments[1];
        pushWidget(Details(int.parse(uri.pathSegments[1])), detailsPageConfig);
      }
      if (uri.pathSegments[0] == 'listProducts') {
        PageConfiguration productsConfiguration = listProductsPageConfig;
        productsConfiguration.path =
            productsConfiguration.path + "/" + uri.pathSegments[1];
        setPath([
          _createPage(Home(), homePageConfig),
          _createPage(
              Products(int.parse(uri.pathSegments[1])), productsConfiguration),
        ]);
      }
    } else if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      switch (path) {
        case 'splash':
          setNewRoutePath(splashPageConfig);
          break;
        case 'login':
          setNewRoutePath(loginPageConfig);
          break;
        case 'createAccount':
          setPath([
            _createPage(Login(), loginPageConfig),
            _createPage(CreateAccount(), createAccountPageConfig)
          ]);
          break;
        case 'home':
          setNewRoutePath(homePageConfig);
          break;
        case 'cart':
          setPath([
            _createPage(Home(), homePageConfig),
            _createPage(Cart(), cartPageConfig)
          ]);
          break;
        case 'checkout':
          setPath([
            _createPage(Home(), homePageConfig),
            _createPage(Checkout(), checkoutPageConfig)
          ]);
          break;
        case 'profile':
          setPath([
            _createPage(Home(), homePageConfig),
          ]);
          break;
      }
    }
  }

  void remove(Pages routeName) {
    _removePage(_getPage(routeName));
  }
}

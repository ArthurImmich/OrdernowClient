const String SplashPath = '/splash';
const String LoginPath = '/login';
const String CreateAccountPath = '/createAccount';
const String HomePath = '/home';
const String ListProductsPath = '/listProducts';
const String DetailsPath = '/details';
const String CartPath = '/cart';
const String CheckoutPath = '/checkout';

enum Pages {
  Splash,
  Login,
  CreateAccount,
  Home,
  Products,
  Details,
  Cart,
  Checkout,
}

class PageConfiguration {
  final String key;
  String path;
  final Pages uiPage;

  PageConfiguration({
    required this.key,
    required this.path,
    required this.uiPage,
  });
}

PageConfiguration splashPageConfig =
    PageConfiguration(key: 'Splash', path: SplashPath, uiPage: Pages.Splash);
PageConfiguration loginPageConfig =
    PageConfiguration(key: 'Login', path: LoginPath, uiPage: Pages.Login);
PageConfiguration createAccountPageConfig = PageConfiguration(
    key: 'CreateAccount', path: CreateAccountPath, uiPage: Pages.CreateAccount);
PageConfiguration homePageConfig =
    PageConfiguration(key: 'Home', path: HomePath, uiPage: Pages.Home);
PageConfiguration listProductsPageConfig = PageConfiguration(
    key: 'ListProducts', path: ListProductsPath, uiPage: Pages.Products);
PageConfiguration detailsPageConfig =
    PageConfiguration(key: 'Details', path: DetailsPath, uiPage: Pages.Details);
PageConfiguration cartPageConfig =
    PageConfiguration(key: 'Cart', path: CartPath, uiPage: Pages.Cart);
PageConfiguration checkoutPageConfig = PageConfiguration(
    key: 'Checkout', path: CheckoutPath, uiPage: Pages.Checkout);

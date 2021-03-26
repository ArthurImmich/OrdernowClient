import 'dart:async';
import 'package:flutter/material.dart';
import '../router/delegate.dart';
import '../router/ui_pages.dart';

const String LoggedInKey = 'LoggedIn';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loggedIn = false;
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final size = query.size;
    final itemWidth = size.width;
    final itemHeight = itemWidth * (size.width / size.height);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/splash.png',
              width: itemWidth, height: itemHeight),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //getLoggedInState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 2000), () {
        if (loggedIn) {
          Delegate.instance.replace(listItemsPageConfig);
        } else {
          Delegate.instance.replace(loginPageConfig);
        }
      });
    }
  }

  // void getLoggedInState() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   loggedIn = prefs.getBool(LoggedInKey);
  //   if (loggedIn == null) {
  //     loggedIn = false;
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:ordernow/router/navigator.dart';
import '../router/ui_pages.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // saveLoginState();
                  OrdernowNavigator.of(context).delegate
                    .setNewRoutePath(SplashPageConfig);
                },
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void saveLoginState() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(LoggedInKey, false);
  // }
}

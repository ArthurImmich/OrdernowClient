import 'package:flutter/material.dart';
import '../../../router/delegate.dart';
import '../../../router/ui_pages.dart';

class AppBarProfile extends StatefulWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  _AppBarProfileState createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Conta'),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () async {
        (Router.of(context).routerDelegate as Delegate)
            .setNewRoutePath(splashPageConfig);
      },
      child: const Text('Log Out'),
    ));
  }

  // void saveLoginState() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(LoggedInKey, false);
  // }
}

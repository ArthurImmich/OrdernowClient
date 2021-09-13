import 'package:flutter/material.dart';
import '../router/delegate.dart';
import '../router/ui_pages.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 175,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration:
                          const InputDecoration().copyWith(hintText: 'Email'),
                      controller: emailTextController),
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      decoration: const InputDecoration()
                          .copyWith(hintText: 'Password'),
                      controller: passwordTextController),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              (Router.of(context).routerDelegate as Delegate)
                                  .push(createAccountPageConfig),
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            (Router.of(context).routerDelegate as Delegate)
                                .setNewRoutePath(homePageConfig);
                          },
                          child: const Text('Create Account'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void saveLoginState() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(LoggedInKey, true);
  // }
}

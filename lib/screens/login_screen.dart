import 'package:flash_chat/components/long_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
                onChanged: (value) {
                },
                decoration: kLoginTextInputDecoration.copyWith(hintText: "Enter Your Email")),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                onChanged: (value) {
                },
                decoration: kLoginTextInputDecoration),
            const SizedBox(
              height: 24.0,
            ),
            LongButton(
                screenName: () {},
                buttonName: 'Log In',
                color: Colors.lightBlueAccent)
          ],
        ),
      ),
    );
  }
}

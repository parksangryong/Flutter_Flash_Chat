import 'package:flash_chat/components/long_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: kLoginTextInputDecoration.copyWith(
                      hintText: "Enter Your Email")),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: kLoginTextInputDecoration),
              const SizedBox(
                height: 24.0,
              ),
              LongButton(
                  screenName: () async {
                    setState(() {
                      showSpinner=true;
                    });
                    try {
                      final loginUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (loginUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner =false;
                      });
                    } catch (error) {
                      print(error);
                      setState(() {
                        showSpinner = false;
                      });
                      const AlertDialog(title: Text('Fails'), content: Text('no login'),);
                    }
                  },
                  buttonName: 'Log In',
                  color: Colors.lightBlueAccent)
            ],
          ),
        ),
      ),
    );
  }
}

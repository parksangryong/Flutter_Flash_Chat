import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/long_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 60,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                      child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            LongButton(
                screenName: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                buttonName: 'Log In',
                color: Colors.lightBlueAccent),
            LongButton(
                screenName: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                buttonName: 'Register',
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}

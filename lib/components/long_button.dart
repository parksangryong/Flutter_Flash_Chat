import 'package:flutter/material.dart';

class LongButton extends StatelessWidget{
  final VoidCallback screenName;
  final String buttonName;
  final Color color;


  const LongButton({super.key, required this.screenName, required this.buttonName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: screenName,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
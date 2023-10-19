import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class NextWordButton extends StatelessWidget {
  const NextWordButton({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
      
      child: Text(
        'Next Word',
        textAlign: TextAlign.center,
      ),
    );
  }
}
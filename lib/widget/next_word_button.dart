import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class NextWordButton extends StatelessWidget {
  const NextWordButton({Key? key ,required this.nextWord}) : super(key: key);
  final VoidCallback nextWord;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextWord,
      child: Container(
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
      ),
    );
  }
}
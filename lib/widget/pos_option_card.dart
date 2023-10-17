import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class PosOptionCard extends StatelessWidget {
  const PosOptionCard({Key? key , required this.option, required this.color,}) : super (key: key);

  final String option;
  // final bool isClicked;
  // final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: color.red != color.green ? neutral : Colors.black,
          ),
        ),
      ),
    );
  }
}
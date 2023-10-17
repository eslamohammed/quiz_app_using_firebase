import 'package:flutter/material.dart';

import '../constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key, 
    required this.question,
    required this.indexAction,
    required this.totalQuestions
    }): super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction+1}/$totalQuestions : This word [ $question ]\t:\tis ?',
        textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            color: neutral
          ),
        ),

    );
  }
}
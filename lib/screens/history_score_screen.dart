import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class HistoryScoresScreen extends StatelessWidget {

  final int score ;
  const HistoryScoresScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History Scores"),
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            Text(
              "student name : Sara \t\t\t Score : 6/10 ",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: neutral
                ),
              ),
            Text(
              "---------------------------------------------------------",
              maxLines: 1,
              textAlign: TextAlign.start,
              style: TextStyle(
              fontSize: 16,
              color: neutral
              ),
            ),
            Text(
              "student name : eslam \t\t\t Score : ${score*2}/10 ",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: neutral
                ),
              ),
            Text(
              "---------------------------------------------------------",
              maxLines: 1,
              textAlign: TextAlign.start,
              style: TextStyle(
              fontSize: 16,
              color: neutral
              ),
            ),

            //eslam@gmail.com
          ],
        ),
      ),
    );
  }
}
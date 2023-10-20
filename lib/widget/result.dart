import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/history_score_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key , required this.result, required this.wordListLength, required this.onPressed,}) : super (key: key);

  final int result;
  final int wordListLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Result',
                style: TextStyle(
                  fontSize: 22.5,
                  color: neutral
                ),
              ),
              const SizedBox(height: 20.0,),
              CircleAvatar(
                radius: 60.0,
                backgroundColor: 
                  result == wordListLength/2 
                  ? Colors.yellow
                  : result < wordListLength/2 
                    ? incorrect 
                    : correct,
                child: Text(
                  "${result*2}/${wordListLength*2}",
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),

              const SizedBox(height: 20.0,),
              Text(
                result == wordListLength/2 
                  ? 'Almost There'
                  : result < wordListLength/2 
                    ? 'Try Again ?' 
                    : 'Great!',
                  style: const TextStyle(color: neutral),
              ),

              const SizedBox(height: 20.0,),
              GestureDetector(
                onTap: onPressed,
                child: const Text('Start Over',style:  TextStyle(fontSize: 20, color: Colors.white , letterSpacing: 1.0,fontWeight: FontWeight.bold),),
              ),

              const SizedBox(height: 15.0,),

              GestureDetector(
                onTap: (){
                  //navigate to page contain score
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>HistoryScoresScreen(score: result,)));
                },
                child: const Text('History Scores',style:  TextStyle(fontSize: 20, color: Colors.white , letterSpacing: 1.0,fontWeight: FontWeight.bold),),
              ),
         
          ],
        ),
      ),
    );
  }
}
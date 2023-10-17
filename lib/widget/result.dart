import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

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
              SizedBox(height: 20.0,),
              CircleAvatar(
                child: Text(
                  "$result/$wordListLength",
                  style: TextStyle(fontSize: 30.0),
                ),
                radius: 60.0,
                backgroundColor: 
                  result == wordListLength/2 
                  ? Colors.yellow
                  : result < wordListLength/2 
                    ? incorrect 
                    : correct,
              ),

              const SizedBox(height: 20.0,),
              Text(
                result == wordListLength/2 
                  ? 'Almost There'
                  : result < wordListLength/2 
                    ? 'Try Again ?' 
                    : 'Great!',
                  style: TextStyle(color: neutral),
              ),

              const SizedBox(height: 20.0,),
              GestureDetector(
                onTap: onPressed,
                child: const Text('Start Over',style:  TextStyle(fontSize: 20, color: Colors.blue , letterSpacing: 1.0),),
              ),
         
          ],
        ),
      ),
    );
  }
}
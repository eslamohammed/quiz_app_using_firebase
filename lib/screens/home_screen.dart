import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/word.dart';
import 'package:quiz_app/widget/next_word_button.dart';
import 'package:quiz_app/widget/pos_option_card.dart';
import 'package:quiz_app/widget/question_widget.dart';
import 'package:quiz_app/widget/result.dart';
// import 'package:quiz_app/models/question_model.dart';

import 'package:quiz_app/models/db_connect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  //creating object from data base model
  var db = DBconnect();

  late Future _words;
  Future<List<Word>> getData() async {
    return db.fetchWords();
  }
  
  @override
  void initState() {
    _words =getData();
    super.initState();
  }

  int index = 0;

  //adding the varaible that responebile for use score
  int score = 0; 
  //creating a boolean value to check if the user have clicked
  bool isPressed = false;
  bool isAlreadySelected = false;


  //creating function to display next word
  void nextWord(int wordLength){
    if (index == wordLength - 1)
      {
        showDialog(
          context: context, 
          barrierDismissible: false,
          builder: (context)=> ResultScreen(
            result: score, 
            wordListLength: wordLength, 
            onPressed: startOver,));
      } else {
        if (isPressed){
          setState(() {
            index++; //rebuild widget tree when index is change.
            isPressed = false;
            isAlreadySelected = false;
          });
        } else {
          //massege if user have not any selection
          //user show answer the current question before going to next 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('please select any answer'),
              behavior: SnackBarBehavior.floating, 
              margin: EdgeInsets.symmetric(vertical: 20.0),
            )
          );
        }
      }
  }
  //creating a function for changing color
  void checkAnswerAndUpdate(bool value){
    if (isAlreadySelected){
      return;
    }else {
      if (value == true)
      {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }
  
  //create a function to start over
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _words as Future<List<Word>>,
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          if (snapshot.hasError){
            return Center(
              child: Text('${snapshot.error}'),
            );
          }else if (snapshot.hasData){
            var extractedData = snapshot.data as List<Word>;
            extractedData.shuffle();
              return Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                title: const Text(
                  'Quiz App',
                ),
                backgroundColor: backgroundColor,
                shadowColor: Colors.transparent,
                // adding score
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Score: ${score*2}',
                      style: const TextStyle(fontSize: 16,),
                    ),
                  )
                ],
              ),
              body: Container(
                color: Colors.transparent,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choose the correct answer..",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          color: neutral
                        ),
                      ),
          
                      const Text(
                        "-------------------------------------------------------------------------------------------------------------------------------",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: neutral
                        ),
                      ),
                      QuestionWidget(
                        indexAction: index, //Currently at 0.
                        question: extractedData[index].word , //from 1st word in list.
                        // totalQuestions: extractedData.length,
                        totalQuestions: 5,
                      ),
          
                      const Divider(color: neutral,),
          
                      const SizedBox(height: 25,),
          
                      for (int i=0 ; i<extractedData[index].pos.length; i++)
                        GestureDetector(
                          onTap: 
                          ()=> checkAnswerAndUpdate(extractedData[index].pos.values.toList()[i],),
                          child: PosOptionCard(
                            option: extractedData[index].pos.keys.toList()[i],
                            color: isPressed ? extractedData[index].pos.values.toList()[i] == true 
                              ? correct 
                              : incorrect
                            : neutral, 
                            // onTap: changeColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: ()=>nextWord(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextWordButton(),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          }else {
            debugPrint('error \n ${snapshot.data}');
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  CircularProgressIndicator(),
                  SizedBox(height: 20,),
                  Text('please wait while Words are loading..',
                  style: TextStyle(
                    // color: Theme.of(context).primaryColor,
                    color: neutral,
                    fontSize: 14.0,
                    decoration: TextDecoration.none,

                  ),)
                ]
                ),
            );
          }
        }
        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
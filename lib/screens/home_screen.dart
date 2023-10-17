import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/part_of_speech.dart';
import 'package:quiz_app/widget/next_word_button.dart';
import 'package:quiz_app/widget/pos_option_card.dart';
import 'package:quiz_app/widget/question_widget.dart';
import 'package:quiz_app/widget/result.dart';
// import 'package:quiz_app/models/question_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // List<Question> _questions = [
  //   Question(id: 1, title: , options: options)
  // ];

  
  List<PartOfSpeech> _wordList = [
      
      PartOfSpeech(
        id: "${1}",
        word: "slowly",
        pos: {'verb':false ,'adverb':true , 'adjective':false , 'noun':false}
      ),
      PartOfSpeech(
        id: "${2}",
        word: "ride",
        pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
      ),
      PartOfSpeech(
        id: "${3}",
        word: "bus",
        pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
      ),
      PartOfSpeech(
        id: "${4}",
        word: "commute",
        pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
      ),
      // PartOfSpeech(
      //   id: "${5}",
      //   word: "emissions",
      //   pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
      // ),
      // PartOfSpeech(
      //   id: "${6}",
      //   word: "walk",
      //   pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
      // ),
      // PartOfSpeech(
      //   id: "${7}",
      //   word: "fast",
      //   pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
      // ),
      // PartOfSpeech(
      //   id: "${8}",
      //   word: "car",
      //   pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
      // ),
      // PartOfSpeech(
      //   id: "${9}",
      //   word: "crowded",
      //   pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
      // ),
      // PartOfSpeech(
      //   id: "${10}",
      //   word: "arrival",
      //   pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
      // ),
      // PartOfSpeech(
      //   id: "${11}",
      //   word: "emit",
      //   pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
      // ),
      // PartOfSpeech(
      //   id: "${12}",
      //   word: "independent",
      //   pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
      // ),
      // PartOfSpeech(
      //   id: "${13}",
      //   word: "convenient",
      //   pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
      // ),
      // PartOfSpeech(
      //   id: "${14}",
      //   word: "lane",
      //   pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
      // ),
      // PartOfSpeech(
      //   id: "${15}",
      //   word: "heavily",
      //   pos: {'verb':false ,'adverb':true , 'adjective':false , 'noun':false}
      // ),
  ];
  
  int index = 0;

  //adding the varaible that responebile for use score
  int score = 0; 
  //creating a boolean value to check if the user have clicked
  bool isPressed = false;
  bool isAlreadySelected = false;
  //creating function to display next word
  void nextWord(){
    if (index == _wordList.length - 1)
      {
        showDialog(
          context: context, 
          barrierDismissible: false,
          builder: (context)=> ResultScreen(
            result: score, 
            wordListLength: _wordList.length, 
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
              'Score: $score',
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
              Text(
                "Choose the correct answer..",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: neutral
                ),
              ),

              Text(
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
                question: _wordList[index].word , //from 1st word in list.
                totalQuestions: _wordList.length,
              ),

              Divider(color: neutral,),

              SizedBox(height: 25,),

              for (int i=0 ; i<_wordList[index].pos.length; i++)
                GestureDetector(
                  onTap: 
                  ()=> checkAnswerAndUpdate(_wordList[index].pos.values.toList()[i],),
                  child: PosOptionCard(
                    option: _wordList[index].pos.keys.toList()[i],
                    color: isPressed ? _wordList[index].pos.values.toList()[i] == true 
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextWordButton(nextWord: nextWord,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
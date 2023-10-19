
import 'package:flutter/material.dart';
import 'package:quiz_app/models/db_connect.dart';
import 'package:quiz_app/models/word.dart';

import 'screens/home_screen.dart';


void main(){

  var db = DBconnect();
  db.fetchWords();
  // db.addWord(
  //   Word(
  //     id: "16", 
  //     word: "define", 
  //     pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false},
  //   )
  // );


  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
   }
}
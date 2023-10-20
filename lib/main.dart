
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'screens/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
    
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyCZ8FC1RsaenqDyq4vnwBPIm9SyEsmV8XI",
      appId: "02d2e855-f682-4eb7-af3d-799111f796b7",
      messagingSenderId: "messaging id",
      projectId: "project id here",
    ),
  );

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

      home: LoginPage(),
      // home: HomeScreen(),
    );
   }
}

// for local words
  // List<Word> _wordList = [
      
  //     Word(
  //       id: "${1}",
  //       word: "slowly",
  //       pos: {'verb':false ,'adverb':true , 'adjective':false , 'noun':false}
  //     ),
  //     Word(
  //       id: "${2}",
  //       word: "ride",
  //       pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
  //     ),
  //     Word(
  //       id: "${3}",
  //       word: "bus",
  //       pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
  //     ),
  //     Word(
  //       id: "${4}",
  //       word: "commute",
  //       pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
  //     ),
  //     Word(
  //       id: "${5}",
  //       word: "emissions",
  //       pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
  //     ),
  //     Word(
  //       id: "${6}",
  //       word: "walk",
  //       pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
  //     ),
  //     Word(
  //       id: "${7}",
  //       word: "fast",
  //       pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
  //     ),
  //     Word(
  //       id: "${8}",
  //       word: "car",
  //       pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
  //     ),
  //     Word(
  //       id: "${9}",
  //       word: "crowded",
  //       pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
  //     ),
  //     Word(
  //       id: "${10}",
  //       word: "arrival",
  //       pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
  //     ),
  //     Word(
  //       id: "${11}",
  //       word: "emit",
  //       pos: {'verb':true ,'adverb':false , 'adjective':false , 'noun':false}
  //     ),
  //     Word(
  //       id: "${12}",
  //       word: "independent",
  //       pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
  //     ),
  //     Word(
  //       id: "${13}",
  //       word: "convenient",
  //       pos: {'verb':false ,'adverb':false , 'adjective':true , 'noun':false}
  //     ),
  //     Word(
  //       id: "${14}",
  //       word: "lane",
  //       pos: {'verb':false ,'adverb':false , 'adjective':false , 'noun':true}
  //     ),
  //     Word(
  //       id: "${15}",
  //       word: "heavily",
  //       pos: {'verb':false ,'adverb':true , 'adjective':false , 'noun':false}
  //     ),
  // ];
  
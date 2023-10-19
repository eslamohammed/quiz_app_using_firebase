
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/models/word.dart';

class DBconnect {

  final url = Uri.parse('https://quizapp-6718b-default-rtdb.firebaseio.com/words.json');

  // add data to firebase --database
  Future<void> addWord(Word word) async {

    http.post(
      url,
      body: json.encode({
        'id' : word.id,
        'word' : word.word,
        'pos' : word.pos,
        }),
      );
  }

  // fetch data from firebase --database

  Future<List<Word>> fetchWords() async {

    return http.get(url).then((response){
        // var data = json.decode(response.body);
      var data = json.decode(response.body)  as Map<String,dynamic>;
      // Map<String,dynamic>
      List<Word> newWords =[];
      
      data.forEach((key, value){
        var newWord = Word(
          id: key, 
          word: value['word'], 
          pos: Map.castFrom(value['pos']),
        );
        newWords.add(newWord);
      },);
      return newWords;
      // print(newWords);
      // // print(data);

    } );
  }
}
// create our question model

class Question {
  // defining how the question will look like.
  // every Question will have An id , title and options
  final String id ;
  final String title ;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.title,
    required this.options,
  });


  //to print question on console
  @override
  String toString(){
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
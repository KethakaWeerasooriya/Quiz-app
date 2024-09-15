

class QuizQuestion  {
  const QuizQuestion(this.test, this.answers);


  final String test;
  final List<String> answers;

   List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
    
  }

  
} 
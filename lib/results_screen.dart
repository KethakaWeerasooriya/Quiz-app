
import 'package:flutter/material.dart';
import 'package:quiz/Data/questions.dart';
import 'package:quiz/questionsummry/questionsummry.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,  required this.choosenAnswers, required this.onRestart});



final void Function() onRestart;
  final List<String> choosenAnswers ;

  List<Map<String, Object>> getSummsaryData() {

    final  List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].test, 

        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
        
      });
      
    }
    return summary;
  }

  @override 
  Widget build(BuildContext context) {

final summaryData = getSummsaryData();    
final numTotalQuestions = questions.length;
final numCorrectQuestions = summaryData.where((data) {
   
  return data['user_answer'] == data['correct_answer'];
}).length;


    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "you have answered $numCorrectQuestions out of$numTotalQuestions correct questions",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionSummary( summaryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton(onPressed: onRestart, child: const Text('Restart Quiz')),
                
                
              ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:quiz/Data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }


void resetQuiz() {
  setState(() {
    selectedAnswers = [];
    activeScreen = 'questions-screen';
  });
}
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length ==questions.length) {
      setState(() {
        
        activeScreen = 'Results-Screen';
      });;
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'Questions-Screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'Results-Screen') {
      screenWidget =  ResultsScreen(choosenAnswers: selectedAnswers,
      onRestart: resetQuiz,);
    }
    /*final screenWidget = activeScreen ==  'start-screen'
                ? StartScreen(switchScreen)
                : const QuestionsScreen();*/

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 226, 141, 241)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: screenWidget),
      ),
    );
  }
}

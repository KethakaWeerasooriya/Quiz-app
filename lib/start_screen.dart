import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(  this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(132, 255, 255, 255),
              ),
            
            /*Opacity(
              opacity: 0.5 ,
              child: Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
              ),
            ),*/
            const SizedBox(height: 80),
            Text('Quiz App',
                style: GoogleFonts.lato (fontSize: 24, color: Colors.white)),
            OutlinedButton.icon(
                onPressed: startQuiz ,
                style: OutlinedButton.styleFrom(
                  foregroundColor:Colors.white, // text(white)
                ),
                icon: const Icon(Icons.arrow_right_alt), 
                label: const Text('Start Quiz')),
          ]),
    );
  }
}

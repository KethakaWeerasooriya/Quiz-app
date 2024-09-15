import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questionsummry/questionidentifire.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: isCorrectAnswer
              ? Colors.green.withOpacity(0.1)
              : Colors.red.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionIdentifier(
                      isCorrectAnswer: isCorrectAnswer,
                      questionIndex: itemData['question_index'] as int,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        itemData['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildAnswerRow('Your Answer', itemData['user_answer'] as String,
                    isCorrectAnswer ? Colors.green : Colors.red),
                const SizedBox(height: 8),
                _buildAnswerRow('Correct Answer', itemData['correct_answer'] as String,
                    Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerRow(String label, String answer, Color color) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: GoogleFonts.lato(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            answer,
            style: GoogleFonts.lato(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
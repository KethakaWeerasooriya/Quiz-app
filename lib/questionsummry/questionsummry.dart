import 'package:flutter/material.dart';
import 'package:quiz/questionsummry/summrtitem.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) { 
            return SummaryItem(data);},).toList(),
            
            
            
            /*Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(height: 10),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                  
                      
                    ],
                  ),
                ),
                
                
              ],
            )*/
            
          
        ),
      ),
    );
  }
}
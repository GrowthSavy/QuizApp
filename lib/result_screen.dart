import 'package:flutter/material.dart';
import 'package:myapp/data/questions.dart';
import 'package:myapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.userAnswers,required this.restartQuiz});

  final List<String> userAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': userAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You answered $numCorrectQuestions out $numTotalQuestions questions correctly!"),
                const SizedBox(height: 30),
                QuestionSummary(summaryData),
                const SizedBox(height: 30),
                TextButton.icon(
                  onPressed: restartQuiz,
                  label: const Text("Restart Quiz"),
                  icon: const Icon(Icons.refresh),
                )
              ],
            )));
  }
}

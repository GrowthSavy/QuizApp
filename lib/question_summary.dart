import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(100),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(((data['question_index'] as int) + 1).toString()),
                  )),
                SizedBox(width:10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text(data['question'] as String),
                  const SizedBox(height:5),
                  Text(style: TextStyle(color: Colors.deepPurple),data['user_answer'] as String),
                  Text(style: TextStyle(color: Colors.deepOrange),data['correct_answer'] as String),
                  SizedBox(height:25)
                            ],),
                )
              ],
              
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practise1/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.chosenAnswers, super.key});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'acorrect_nswer': questions[i].answers[0],
          'answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('xx'),
            const SizedBox(
              height: 30,
            ),
            const Text('list'),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: Text('restart quiz')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterbasicquizapp/data/questions.dart';
import 'package:flutterbasicquizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers,required this.onRestarted});

  final List<String> choosenAnswers;
    final void Function() onRestarted;


  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummaryData();
    final numberofTotalQuestions = questions.length;
    final numberofCorrectQuestions =
        summeryData.where((data) {
          return data['user_answer'] == data['correct_answers'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Your answer $numberofCorrectQuestions out of $numberofTotalQuestions correctly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            QuestionsSummary(summeryData),
            SizedBox(height: 30),
            SizedBox(width: 20),
            TextButton.icon(
              onPressed: onRestarted,
              label: Text(
                "Restart Quiz!",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.restart_alt_sharp,color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

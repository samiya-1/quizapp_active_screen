import 'package:flutter/material.dart';
import 'package:flutterbasicquizapp/models/answer_button.dart';
import 'package:flutterbasicquizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectAnswer});

final void Function(String answer) onSelectAnswer;



  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) { 
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 178, 136, 233),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, (){

                answerQuestion(answer);
              });
            }),
            // AnswerButton(currentQuestion.answers[0], () {}),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),
          ],
        ),
      ),
    );
  }
}

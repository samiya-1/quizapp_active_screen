import 'package:flutter/material.dart';
import 'package:flutterbasicquizapp/data/questions.dart';
import 'package:flutterbasicquizapp/question_screen.dart';
import 'package:flutterbasicquizapp/result_screen.dart';
import 'package:flutterbasicquizapp/starting_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //////////way 1
  // Widget? activeScreen ;

  // @override
  // void initState() {
  //  activeScreen=  Startingpage(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }
  ////////////way 2/way3

  List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
       // selectedAnswer = []; //removed for result because this make list empty
        activeScreen = 'result-screen';
      });
    }
  }

void restartQuiz(){
  setState(() {
    selectedAnswer=[];
    activeScreen='question-screen';
  });
}


  @override
  Widget build(context) {
    Widget screenWidget = Startingpage(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswers);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(choosenAnswers: selectedAnswer, onRestarted: restartQuiz,);
    }


    // if (activeScreen == 'result-screen') {
    //   screenWidget = ResultScreen(choosenAnswers: selectedAnswer,onRestarted:restartQuiz);
    // }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 128, 7, 164),
            const Color.fromARGB(255, 75, 14, 180),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      ////way1
      // child: activeScreen,
      /////way2
      // child:
      //     activeScreen == 'start-screen'
      //         ? Startingpage(switchScreen)
      //         : QuestionScreen(),
      child: screenWidget,
    );
  }
}

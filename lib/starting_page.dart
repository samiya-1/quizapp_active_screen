import 'package:flutter/material.dart';
import 'package:flutterbasicquizapp/Widget/textwidget.dart';

class Startingpage extends StatelessWidget {
  const Startingpage(this.startquiz, {super.key});

  final void Function() startquiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png", width: 300),

          SizedBox(height: 60),

          TextWidgetStyle(textcontent: "Learn Flutter the fun way!"),
          SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startquiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 210, 132, 220),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}

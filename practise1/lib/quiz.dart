import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:practise1/data/questions.dart';
import 'package:practise1/questions_screen.dart';
import 'package:practise1/results_screen.dart';
import 'package:practise1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> slectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    slectedAnswers.add(answer);

    if (slectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
        slectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(chosenAnswers: slectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepOrange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

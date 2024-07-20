import 'package:flutter/material.dart';
import 'package:myapp/questions_screen.dart';
import 'package:myapp/start_screen.dart';
import 'package:myapp/data/questions.dart';
import 'package:myapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(changeState);
  // }
  List<String> userAnswers = [];
  var activeScreen = 'start-screen';

  void changeState() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void addAnswer(String answer) {
    userAnswers.add(answer);
    if (questions.length == userAnswers.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      userAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(changeState)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(changeState);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: addAnswer);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(userAnswers: userAnswers, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 196, 191, 189),
                Color.fromRGBO(241, 220, 191, 1)
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

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[900],
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizzPage(),
        ),
      ),
    ));
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  /*
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs',
    'Approximately one quarter of the human bones are in the feet',
    'A slug\'s blood is green'
  ];

  List<bool> answers = [false, true, true];
  */

  QuestionBrain questionBrain = QuestionBrain();

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBrain.questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('You got it right');
                } else {
                  print('You got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBrain.questionBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  print('You got it right');
                } else {
                  print('You got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: const Text('False'),
            ),
          ),
        ),
      ],
    );
  }
}

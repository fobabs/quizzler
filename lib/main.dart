import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  List<Icon> scores = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBrain.getCorrectAnswer();
    setState(() {
      if (questionBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You have reached the end of the quiz.',
        ).show();

        questionBrain.reset();
        scores = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scores.add(const Icon(
            Icons.check,
            color: Colors.green,
            size: 20,
          ));
        } else {
          scores.add(const Icon(
            Icons.close,
            color: Colors.red,
            size: 20,
          ));
        }
      }

      questionBrain.nextQuestion();
    });
  }

  QuestionBrain questionBrain = QuestionBrain();

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
                questionBrain.getQuestionText(),
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
                checkAnswer(true);
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
                checkAnswer(false);
              },
              child: const Text('False'),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: scores,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import './Quiz.dart';
import './Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What is your favorite color???',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorit animal???',
      'answers': [
        {'text': 'Ghoda', 'score': 5},
        {'text': 'Kutta', 'score': 1},
        {'text': 'Murga', 'score': 3},
        {'text': 'Billi', 'score': 10}
      ],
    },
    {
      'questionText': 'Which room you belong to???',
      'answers': [
        {'text': '417', 'score': 5},
        {'text': '419', 'score': 1},
        {'text': '404', 'score': 3},
        {'text': '109', 'score': 10}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Android 2.0"),
          ),
          body: _questionIndex < questions.length
              ? Quiz(
                  answerQuestion: answerQuestion,
                  questionIndex: _questionIndex,
                  questions: questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}

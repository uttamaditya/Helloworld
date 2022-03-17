import 'package:flutter/material.dart';
import 'package:helloworld/result.dart';

import './quiz.dart';

import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Whats\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 8},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 2},
      ],
    },
    {
      'questionText': 'Whats\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 3},
      ],
    },
    {
      'questionText': 'Whats\'s your favourite Chocolate?',
      'answers': [
        {'text': 'Dairymilk', 'score': 9},
        {'text': 'Kitkat', 'score': 10},
        {'text': 'Munch', 'score': 5},
        {'text': '5 Star', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favourite dish?',
      'answers': [
        {'text': 'Rajma Chawal', 'score': 7},
        {'text': 'Biryani', 'score': 8},
        {'text': 'Masala Dhosa', 'score': 6},
        {'text': 'Palak Paneer', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favourite place?',
      'answers': [
        {'text': 'Jaipur', 'score': 9},
        {'text': 'Shimla', 'score': 10},
        {'text': 'kerala', 'score': 10},
        {'text': 'Home', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;

  var _totalScore = 0;

//This function is called when we click on any of the options and it takes us to
//the next question,,,,,,

  void _wrongAnswer() {
    if (_questionIndex > 0) {
      setState(() {
        _questionIndex = _questionIndex - 1;
      });
    }
  }

//This function is called when we click on the 'Go Back' botton then it takes us
//to the previous question by changing the state of the index of list,,,,,,,,,,,,

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Fun Quiz'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length //ternary operator
            ? Quiz(
                //It's the custom widget which runs when condition is true
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                wrongAnswer: _wrongAnswer,
              )
            : Result(_totalScore), //else this part runs
      ),
    );
  }
}

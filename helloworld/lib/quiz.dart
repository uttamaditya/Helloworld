import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;

  final int questionIndex;

  final Function answerQuestion;

  final VoidCallback wrongAnswer;

  Quiz(
      {required this.answerQuestion,
      required this.wrongAnswer,
      required this.questions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
        FloatingActionButton(
          child: Text(
            'Go back',
            textAlign: TextAlign.center,
          ),
          onPressed: wrongAnswer,
          clipBehavior: Clip.antiAlias,
        ),
      ],
    );
  }
}

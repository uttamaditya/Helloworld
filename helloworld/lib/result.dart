import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'You are awesome';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likable';
    } else if (resultScore <= 16) {
      resultText = 'You are Strange!.....';
    } else {
      resultText = 'You are so Bad!......';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 185, 66, 11),
        ),
      ),
    );
  }
}

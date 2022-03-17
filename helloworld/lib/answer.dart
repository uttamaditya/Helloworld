import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler; //what is VoidCallback?
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        onPressed: selectHandler,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        textColor: Color.fromARGB(215, 202, 62, 19),
      ),
    );
  }
}

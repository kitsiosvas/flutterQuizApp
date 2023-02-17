import 'package:flutter/material.dart';
import 'question.dart';

class QuestionButtonRow extends StatelessWidget {
  final List<Question> questions;
  final Function(int) onQuestionButtonPressed;

  const QuestionButtonRow({
    Key? key,
    required this.questions,
    required this.onQuestionButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {
              onQuestionButtonPressed(index);
            },
            child: Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
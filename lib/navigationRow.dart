import 'package:flutter/material.dart';
import 'package:flutter_test_app/question.dart';
import 'game.dart';

class NavigationRow extends StatelessWidget {
  final Game game;

  const NavigationRow({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: game.questions.length,
        itemBuilder: (context, index) {
          Question question = game.questions[index];
          bool isAnswered = question.selectedAnswerIndex!=-1;
          Color color = isAnswered ? Colors.green : Colors.grey;
          return MaterialButton(
            onPressed: () {
              game.jumpToQuestion(index);
            },
            child: Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 20, color: color),
            ),
          );
        },
      ),
    );
  }
}

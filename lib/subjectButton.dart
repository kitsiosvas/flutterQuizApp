import 'package:flutter/material.dart';
import 'game.dart';
import 'question.dart';
import 'dart:math';

class SubjectButton extends StatelessWidget {
  final String subject;
  final String imagePath;

  const SubjectButton({super.key,
  required this.subject,
  required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.deepOrange,
        ),
        child: Text(subject, style: const TextStyle(fontSize: 25)),
        onPressed: () {
          // Create 30 dummy questions for now
          List<Question> questions = [];
          final Random random = Random();
          for (int i = 1; i <= 30; i++) {
            questions.add(Question("Q$i", ["A1", "A2", "A3", "A4"], random.nextInt(4)));
          }

          Game game = Game(questions);
          game.start(context);
        },
      ),
    );
  }
}

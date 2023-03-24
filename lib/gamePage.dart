import 'package:flutter/material.dart';
import 'game.dart';
import 'questionPanel.dart';
import 'navigationRow.dart';

class GamePage extends StatefulWidget {
  final Game game;

  const GamePage({super.key, required this.game});

  @override
  _GamePageState createState() => _GamePageState();
}


class _GamePageState extends State<GamePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Game'),
      ),
      body: PageView(
        controller: widget.game.pageController,
        children: widget.game.questions
            .map((question) => QuestionPanel(
          question: question,
          game: widget.game,
          onAnswerSelected: (answerIndex) {
            handleAnswerSelected(answerIndex);
          },
        ))
            .toList(),
      ),
      bottomNavigationBar: NavigationRow(
        game: widget.game,
      ),
    );
  }

  void handleAnswerSelected(int answerIndex) {
    setState(() {
      // Call the main Game object's function for selecting the answer.
      // It updates the Question object and if it's the last question, it calls the function to wrap up the game
      widget.game.selectAnswerForQuestion(context, answerIndex);
    });
  }
}
